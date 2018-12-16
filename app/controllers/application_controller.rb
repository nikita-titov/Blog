class ApplicationController < ActionController::Base
  #custom params for devise sign_up
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, 
    	:password, :password_confirmation, :profile_photo) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, 
    	:email, :password, :password_confirmation, :profile_photo) }
  end
end