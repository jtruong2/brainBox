class Admin::CategoriesController < Admin::AdminController
  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      flash[:notice] = "Category added"
      redirect_to admin_dashboard_index_path
    else
      flash[:warning] = "An error occurred, try again"
      redirect_to new_admin_category_path
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Category was removed"
    redirect_to admin_dashboard_index_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
