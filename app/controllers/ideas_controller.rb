class IdeasController < ApplicationController

  def index
    @ideas = current_user.ideas.all
  end

  def new
    @idea = Idea.new
    @images = Image.all
  end

  def create
    @idea = current_user.ideas.create(idea_params)
    if @idea.save
      flash[:notice] = "Idea saved"
      redirect_to user_idea_path(current_user, @idea)
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
  end

  def update
    @idea = current_user.ideas.find(params[:id])
    @idea.update(idea_params)
    flash[:notice] = "Idea updated"
    redirect_to user_idea_path(current_user, @idea)
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    flash[:notice] = "Idea deleted"
    redirect_to user_ideas_path(current_user)
  end

  private

  def idea_params
    params.require(:idea).permit(:content, :category_id, { image_ids: []})
  end
end
