module SessionsHelper
  def user_is_host
    if !current_user.is_host?
      redirect_to events_path, :alert["Vous n'avez pas accès à ce contenu !"]
    end
  end
  
end