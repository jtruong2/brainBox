class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Successful login"
      redirect_to @user
    else
      flash[:warning] =  "Failed login attempt, try again"
      redirect_to new_session_path
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You've logged out"
    redirect_to root_path
  end
end
