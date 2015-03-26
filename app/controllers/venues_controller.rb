class VenuesController < ApplicationController
<<<<<<< HEAD
  before_action :find_wedding
=======
  before_action :find_wedding, :set_venue

  def update
    respond_to do |format|
      if @venue.update(venue_params)
        format.html { redirect_to @wedding, notice: 'Venue was successfully updated.' }
        format.json { render :show, status: :ok, location: @venue }
      else
        format.html { render :edit }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end
>>>>>>> fcb9577bfd1c4afb01b4111aab83f7806577c739

  def edit
    @venue = @wedding.venues.first
  end

  def new
  	@venue = @wedding.venues.new
  end

  def create
   
   @venue = @wedding.venues.new(venue_params)
    if @venue.save
      flash[:success] = "Added todo list item."
      redirect_to wedding_path(params[:wedding_id])
    else
      flash[:error] = "there was a problem adding that todo list item."
      render action: :new
    end
  end

  private

  def find_wedding
  	@wedding = Wedding.find(params[:wedding_id])
  end

def venue_params
      params[:venue].permit(:name, :description, :street, :city, :zip, :state, :url)
    end
<<<<<<< HEAD
=======

    def set_venue
 @venue = Venue.find(params[:id])
    end

>>>>>>> fcb9577bfd1c4afb01b4111aab83f7806577c739
   
end
