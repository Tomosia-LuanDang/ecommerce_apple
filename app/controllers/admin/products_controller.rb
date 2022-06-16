class Admin::ProductsController < Admin::BaseController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result.page(params[:page]).per(15)
  end

  def destroy
    Product.find(params[:id]).destroy
    @q = Product.ransack(params[:q])
    @products = @q.result.page(params[:page]).per(15)
  end
end
