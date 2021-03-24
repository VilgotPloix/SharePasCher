class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(users)
    events_path
  end
end