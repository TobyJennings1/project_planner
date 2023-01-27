class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:username])

    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path

    else
      message = "[InvalidLoginError] Please enter a Valid Username and Password"
      redirect_to login_path, notice: message
    end
  end

  def login
    
  end
end