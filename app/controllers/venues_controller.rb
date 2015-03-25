class VenuesController < ApplicationController
  before_action :find_wedding

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
   
end
