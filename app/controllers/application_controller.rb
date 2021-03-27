class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include SessionsHelper, EventsHelper, UsersHelper

  protected

  def after_sign_in_path_for(users)
    events_path
  end 
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:is_host])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :gender, :birth_day])
  end  
end
