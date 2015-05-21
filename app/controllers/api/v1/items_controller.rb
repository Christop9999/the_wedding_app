class API::V1::ItemsController < ApplicationController
def create
    result = { status: "failed" }

    begin
      params[:image] = parse_image_data(params[:image]) if params[:image]
      item = Item.new
      item.image = params[:image]

      if item.save
        result[:status] = "success"
      end
    rescue Exception => e
      Rails.logger.error "#{e.message}"
    end

    render json: result.to_json
  ensure
    clean_tempfile
  end

  # This part is actually taken from http://blag.7tonlnu.pl/blog/2014/01/22/uploading-images-to-a-rails-app-via-json-api. I tweaked it a bit by manually setting the tempfile's content type because somehow putting it in a hash during initialization didn't work for me.
  def parse_image_data(image_data)
    @tempfile = Tempfile.new('item_image')
    @tempfile.binmode
    @tempfile.write Base64.decode64(image_data[:content])
    @tempfile.rewind

    uploaded_file = ActionDispatch::Http::UploadedFile.new(
      tempfile: @tempfile,
      filename: image_data[:filename]
    )

   uploaded_file.content_type = image_data[:content_type]
    uploaded_file
  end

  def clean_tempfile
    if @tempfile
      @tempfile.close
      @tempfile.unlink
    end
  end
end
