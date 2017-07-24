class UsersController < ApplicationController
  before_action :validate_user, only: [:show]

  def validate_user
    render file: "/public/404" unless current_user.id == params[:id].to_i
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Account created"
      redirect_to @user
    else
      flash[:warning] = "Invalid entry, try again"
      redirect_to new_user_path
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
