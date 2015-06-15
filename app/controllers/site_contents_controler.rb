class SiteContentsController < ApplicationController



	private

	def site_content_params
		params.require(:pin).permit(:title, :description, :image)
	end

	def find_site_content
		@pin = Pin.find(params[:id])
	end

	def find_wedding
		@wedding = Wedding.find(params[:wedding_id])
	end





end


end