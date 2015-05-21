class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 layout :wedding_layout

protected

def wedding_layout
      if user_signed_in? && current_user.admin?
      "application" 
    else
      "wedding_view"
    end
end


def layout_by_resource
  if devise_controller? && resource_name == :admin
     "application"
  else
   "wedding_view"
  end
end
end