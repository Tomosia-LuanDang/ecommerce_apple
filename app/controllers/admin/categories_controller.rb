class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def destroy
    Category.find(params[:id]).destroy
    @q = Category.ransack(params[:q])
    @categories = @q.result.page(params[:page]).per(15)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    Category.find(params[:id]).update!(name: params[:category][:name])
    flash[:success] = "Update success!"
    redirect_to admin_categories_path
  end

  def show

    binding.pry
    
    @categories = Category.all
    @product_by_cate = Category.find(params[:id]).products.page(params[:page]).per(12)
  end
end
