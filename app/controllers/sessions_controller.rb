class SessionsController < ApplicationController

  def create
    @user = User.where(email: params[:email]).first
    if @user.confirmed? and @user.authentificate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, primary: "Tu es connecté"
    else
      redirect_to user_session_path, warning: "Mot de passe ou email invalide"
    end
  end  

  def destroy
    session[:user_id] = nil
    redirect_to root_path, sucess: "TU ES DECO"
  end

end
