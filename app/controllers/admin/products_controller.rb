class Admin::ProductsController < Admin::BaseController
  def index
    @q = Product.includes(:category).ransack(params[:q])
    @products = @q.result.page(params[:page]).per(15).oldest
    @category = Category.all
  end

  def new
    @product = Product.new
    @category = Category.all
  end

  def create
    product = Product.new(product_params)
    product.category_id = params[:category_id]
    product.sold = 0
    product.save!
    redirect_to admin_products_path
  end

  def destroy
    Product.find(params[:id]).destroy
    @q = Product.ransack(params[:q])
    @products = @q.result.page(params[:page]).per(15)
  end

  def edit
    @product = Product.find(params[:id])
    @category = Category.all
  end

  def update
    Product.find(params[:id]).update!(product_params)
    flash[:success] = "Update success!"
    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :image, :price, :residual, :description)
  end
end
