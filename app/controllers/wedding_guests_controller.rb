class WeddingGuestsController < ApplicationController

	def index
		
	end

	def new
    
    end

		

  def create
  	if params[:wedding_id] 
  		@guest = User.find(params[:guest_id])
      @wedding = Wedding.find(params[:wedding_id])
  		@guest.wedding_part << @wedding
      @guest.save

      redirect_to weddings_path
  	else
         flash[:error] = "Wedding required"
         redirect_to search_results_path
    end

          
       
                  
            
   end
          
        
     

end





