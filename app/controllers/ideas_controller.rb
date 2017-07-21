class IdeasController < ApplicationController
  before_action :validate_user, only: [:show, :index]

  def validate_user
    render file: "/public/404" unless current_user.id == params[:user_id].to_i
  end

  def index
    @user = User.find(params[:user_id])
    @ideas = @user.ideas
  end

  def new
    @user = User.find(params[:user_id])
    @idea = Idea.new
  end

  def create
    @idea = @user.ideas.create(idea_params)

    if @idea.save
      flash[:notice] = "Idea saved"
      redirect_to user_idea_path(@user, @idea)
    else
      flash[:notice] = "An error occured, try again"
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def edit
    @idea = Idea.find(params[:id])
    @user = User.find(@idea.user_id)
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    flash[:notice] = "Idea deleted"
    redirect_to user_ideas_path(@idea.user_id)
  end

  private

  def idea_params
    params.require(:idea).permit(:content, :category_id)
  end
end
