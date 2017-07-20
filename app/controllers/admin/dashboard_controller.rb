class Admin::DashboardController < Admin::AdminController
  def index
    @categories = Category.all
    @images = Image.all
  end
end
