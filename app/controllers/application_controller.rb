class ApplicationController < ActionController::Base
	include CanCan::ControllerAdditions
  protect_from_forgery with: :exception
 	before_action :configure_permitted_parameters, if: :devise_controller?

	rescue_from CanCan::AccessDenied do |exception|
  redirect_to main_app.root_url, :alert => exception.message
	end

	protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:password,:password_confirmation])
  end

end
