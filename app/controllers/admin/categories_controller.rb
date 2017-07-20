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
      flash[:notice] = "An error occurred, try again"
      redirect_to new_admin_category
    end
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
