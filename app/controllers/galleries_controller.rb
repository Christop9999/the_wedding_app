class GalleriesController < ApplicationController
  # GET /galleries
  # GET /galleries.json
  before_action :find_wedding, only: [:index, :new, :create, :edit, :update, :destroy]
  def index
    @galleries = @wedding.galleries.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @galleries }
    end
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
    @gallery  = Gallery.find(params[:id])
    @pictures = @gallery.pictures

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gallery }
    end
  end

  # GET /galleries/new
  # GET /galleries/new.json
  def new
   
    @gallery = @wedding.galleries.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gallery }
    end
  end

  # GET /galleries/1/edit
  def edit
    @gallery = Gallery.find(params[:id])
  end

  # POST /galleries
  # POST /galleries.json
  def create
    @gallery = @wedding.galleries.new(gallery_params)

    respond_to do |format|
      if @gallery.save

        if params[:images]
          # The magic is here ;)
          params[:images].each { |image|
            @gallery.pictures.create(image: image)
          }
        end

        format.html { redirect_to wedding_gallery_path(@wedding, @gallery), notice: 'Gallery was successfully created.' }
        format.json { render json: @gallery, status: :created, location: @gallery }
      else
        format.html { render action: "new" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /galleries/1
  # PUT /galleries/1.json
  def update
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(gallery_params)
        if params[:images]
          # The magic is here ;)
          params[:images].each { |image|
            @gallery.pictures.create(image: image)
          }
        end
        format.html { redirect_to wedding_gallery_path(@wedding, @gallery), notice: 'Gallery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to wedding_galleries_path(@wedding) }
      format.json { head :no_content }
    end
  end

  private

  def gallery_params
    params.require(:gallery).permit(:description,
                                    :name,
                                    :pictures,
                                    :wedding_id,
                                    :user_id
                                   )
  end
def find_wedding
   @wedding = Wedding.find(params[:wedding_id])
 end

end