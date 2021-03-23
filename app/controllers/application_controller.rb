class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include SessionsHelper, EventsHelper, UsersHelper

  protected

  add_flash_types :primary, :link, :info, :success, :warning, :danger
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birth_day, :age, :gender, :is_host])
  end  
end
