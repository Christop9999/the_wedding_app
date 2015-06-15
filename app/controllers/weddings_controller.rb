class WeddingsController < ApplicationController
  #before_action :set_wedding
  before_filter :authenticate_user!
  before_action :wedding_layout
 # layout :layout_by_resource
  #layout :wedding_layout
  # GET /weddings
  # GET /weddings.json



  def index
  if current_user.admin
    @weddings = current_user.wedding 
  else
    @weddings = current_user.wedding_part
  end
  
 
  
  
  
  end

  def search_results
    if params[:search]
      @weddings = Wedding.search(params[:search]).order("created_at DESC")
    else
      @weddings = Wedding.order("created_at DESC")
    end
  end

  

  

  # GET /weddings/1
  # GET /weddings/1.json
  def show
    
    @wedding = Wedding.find(params[:id])
    render layout: 'show'
end

  # GET /weddings/new
  def new
    @wedding = Wedding.new
    
  end

  # GET /weddings/1/edit
  def edit
    #@wedding.build_document
  end

  # POST /weddings
  # POST /weddings.json
  def create

    @wedding = current_user.wedding(wedding_params)
  
    

    respond_to do |format|
      if @wedding.save
        format.html { redirect_to @wedding, notice: 'Wedding was successfully created.' }
        format.json { render :show, status: :created, location: @wedding }
        if params[:pictures]
          params[:pictures].each { |picture|
            @wedding.site_contents.create(picture: picture)
          }
        end

      else
        format.html { render :new }
        format.json { render json: @wedding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weddings/1
  # PATCH/PUT /weddings/1.json
  def update
    respond_to do |format|
      if @wedding.update(wedding_params)
        format.html { redirect_to @wedding, notice: 'Wedding was successfully updated.' }
        format.json { render :show, status: :ok, location: @wedding }
         format.json { render :show, status: :created, location: @wedding }
        if params[:pictures]
          params[:pictures].each { |picture|
            @wedding.site_contents.create(picture: picture)
          }
        end
      else
        format.html { render :edit }
        format.json { render json: @wedding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weddings/1
  # DELETE /weddings/1.json
  def destroy
    @wedding.destroy
    respond_to do |format|
      format.html { redirect_to weddings_url, notice: 'Wedding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wedding
      @wedding = Wedding.find(params[:id]) if params[:id]
    end

    def set_guest

    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def wedding_params
      params.require(:wedding).permit(:name, :bride, :groom, :date, :site_contents) if params[:wedding]
    end

  

    def wedding_layout
      if current_user.admin?
       @wedding = Wedding.find(params[:id]) if params[:id]
      "application"
    else
       @wedding = Wedding.find(params[:id]) if params[:id]
       "wedding_view"
    end
  
end

end



