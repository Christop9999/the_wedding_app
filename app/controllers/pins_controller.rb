class PinsController < ApplicationController
	before_action :find_pin, only: [:show, :edit, :destroy, :update, :upvote]
	before_action :find_wedding, only: [:new, :create, :show, :index, :destroy, :update, :edit]

	def index
		@pins = @wedding.pins.all.order("created_at DESC")
	end

	def new
		@pin = @wedding.pins.build

	end

	def create
		@pin = @wedding.pins.new(pin_params)
		@pin.user = current_user

		if @pin.save
			redirect_to wedding_pin_path(@wedding, @pin), notice: "Successfully created new Pin"
		else
			render 'new'
		end
	end

	def edit

	end

	def update

		if @pin.update(pin_params)
			redirect_to wedding_pin_path(@wedding, @pin), notice: "Pin was Successfully updated"

		else
			render 'edit'
		end
	end


				

	def destroy
		@pin.destroy
		redirect_to wedding_pins_path, notice: "Pin was Successfully deleted"

	end

	def show


	end

	def upvote
		@pin.upvote_by current_user
		redirect_to :back
	end




	private

	def pin_params
		params.require(:pin).permit(:title, :description, :image, :wedding_id, :user_id)
	end

	def find_pin
		@pin = Pin.find(params[:id])
	end

	def find_wedding
		@wedding = Wedding.find(params[:wedding_id])
	end







end
