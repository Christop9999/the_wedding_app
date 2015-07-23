class GuestListsController < ApplicationController
  before_action :set_guest_list, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @guest_lists = GuestList.all
    @guest_list = GuestList.new
  end

  def show
    respond_with(@guest_list)
  end

  def new
    @guest_list = GuestList.new
    respond_with(@guest_list)
  end

  def edit
  end

  def create
    @guest_list = GuestList.new(guest_list_params)
   
    respond_to do |format|
      if @guest_list.save
        format.html { redirect_to @guest_list, notice: 'Person was successfully created.' }
        format.json { render action: 'show', status: :created, location: @guest_list }
        # added:
        format.js   { render action: 'show', status: :created, location: @guest_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @guest_list.errors, status: :unprocessable_entity }
        # added:
        format.js   { render json: @guest_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @guest_list.update(guest_list_params)
    respond_with(@guest_list)
  end

  def destroy
    @guest_list.destroy
    respond_with(@guest_list)
  end

  private
    def set_guest_list
      @guest_list = GuestList.find(params[:id])
    end

    def guest_list_params
      params.require(:guest_list).permit(:wedding_id, :first_name, :last_name)
    end
end
