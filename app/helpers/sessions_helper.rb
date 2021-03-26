module SessionsHelper
  	def user_is_host
    	if !current_user.is_host?
      		redirect_to events_path, :alert["Vous n'avez pas accès à ce contenu !"]
    	end
  	end

  	def forget(user)

 		 user.update(remember_digest: nil)

 		 cookies.delete(:user_id)
 		 cookies.delete(:remember_token)

	end

	def log_out(user)
  		session.delete(:user_id)
  		forget(user)
	end


  
end
