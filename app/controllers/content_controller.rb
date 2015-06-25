class ContentController < ApplicationController
  before_action :set_wedding
 before_action :set_content, only: [:show, :edit, :update, :destroy]


  def index
   @content = @wedding.content
    
  end

  def show
    
    
  end

  def new
    @content = @wedding.build_content

  end

  def edit

  end

  def create
    @content = @wedding.build_content(content_params)
    @content.save
    redirect_to wedding_content_path(@wedding, @content)
  end

  def update
    @content.update(content_params)
    respond_with(@content)
  end

  def destroy
    @content.destroy
    redirect_to wedding_content_index_path
      end

  private
    def set_content
      @content = @wedding.content
    end

    def content_params
      params.require(:content).permit(:wedding_id, :header) if params[:content]
    end

    def set_wedding
      @wedding = Wedding.find(params[:wedding_id])
    end

end
