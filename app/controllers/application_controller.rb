class ApplicationController < ActionController::Base
	before_action :configure_sign_up_params, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   def configure_sign_up_params
     devise_parameter_sanitizer.for(:sign_up) << :name
   end
end
