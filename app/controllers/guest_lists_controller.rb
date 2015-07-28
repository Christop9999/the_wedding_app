class GuestListsController < ApplicationController
  before_action :set_guest_list, only: [:show, :edit, :update, :destroy]
  before_action :find_wedding, only: [:new, :create, :show, :index, :destroy, :update, :edit]

  respond_to :html

  def index
    @guest_lists = @wedding.guest_lists.all
    @guest_list = @wedding.guest_lists.build
  end

  def show
    respond_with(@guest_list)
  end

  def new
    @guest_list = @wedding.guest_lists.new
    respond_with(@guest_list)
  end

  def edit
  end

  def create
    @guest_list = @wedding.guest_lists.new(guest_list_params)
   
    respond_to do |format|
      if @guest_list.save
        format.html { redirect_to wedding_guest_lists_path(@guest_list), notice: 'Person was successfully created.' }
        format.json { render action: 'show', status: :created, location: @guest_list }
        # added:
        format.js   { render action: 'show', status: :created, location: wedding_guest_lists_path(@wedding) }
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
    respond_with(@guest_list, location: wedding_guest_lists_path(@wedding))
  end

  def destroy
    @guest_list.destroy
    respond_to do |format|
      format.html { redirect_to wedding_guest_lists_path(@wedding) }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private
    def set_guest_list
      @guest_list = GuestList.find(params[:id])
    end

    def guest_list_params
      params.require(:guest_list).permit(:wedding_id, :first_name, :last_name, :email)
    end

  

  def find_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end
end
