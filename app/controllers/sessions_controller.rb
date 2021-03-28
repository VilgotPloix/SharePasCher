class SessionsController < ApplicationController

  def create
    @user = User.where(email: params[:email]).first
    if @user.confirmed? and @user.authentificate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to user_session_path
    end
  end  

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
