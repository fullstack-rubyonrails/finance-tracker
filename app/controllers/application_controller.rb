class ApplicationController < ActionController::Base
  # Below line will pop-up login page
  before_action :authenticate_user!
  # End of Below line will pop-up login page
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

end
