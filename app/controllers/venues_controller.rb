class VenuesController < ApplicationController
  
  before_action :find_wedding
  before_action :set_venue, only: [:edit, :update]

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

  def show

  end

def destroy
  if @wedding.venues.first.destroy
  respond_to do |format|
      format.html { redirect_to weddings_url, notice: 'Venue was successfully destroyed.' }
      format.json { head :no_content }
    end
  else
    respond_to do |format|
      format.html { redirect_to weddings_url, notice: 'Venue was not destroyed.' }
      format.json { head :no_content }
    end

end
end

  def edit
    @venue = @wedding.venues.first
  end

  def new
  	@venue = @wedding.venues.new
  end

  def create
   
   @venue = @wedding.venues.new(venue_params)
    if @venue.save
      flash[:success] = "Added venue to wedding."
      redirect_to wedding_venues_path(@wedding)
    else
      flash[:error] = "there was a problem adding venue to wedding."
      render action: :new
    end
  end

  private

  def find_wedding
  	@wedding = current_user.wedding
  end

def venue_params
      params[:venue].permit(:name, :description, :street, :city, :zip, :state, :url)
    end


    def set_venue
 @venue = current_user.wedding.venues.find(params[:id])
    end


end
