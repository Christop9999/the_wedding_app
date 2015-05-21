class WelcomeController < ApplicationController

layout false

def admin_home

end

def index

end



protected

def wedding_layout
      if user_signed_in? && current_user.admin?
      "application" 
    else
      "wedding_view"
    end
end



end



