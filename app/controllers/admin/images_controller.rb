class Admin::ImagesController < Admin::AdminController
  def new
    @image = Image.new
  end

  def create
    @image = Image.create(image_params)
    if @image.save
      flash[:notice] = "Image saved"
      redirect_to admin_dashboard_index_path
    else
      flash[:warning] = "An error occured, try again"
      redirect_to new_admin_image_path
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = "Image deleted"
    redirect_to admin_dashboard_index_path
  end

  private

  def image_params
    params.require(:image).permit(:image)
  end
end
