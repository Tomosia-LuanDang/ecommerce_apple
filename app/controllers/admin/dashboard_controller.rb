class Admin::DashboardController < Admin::BaseController
  def index
    @product    = Product.all
    @user       = User.all
    @order      = Order.all
    @order_item = OrderItem.all
  end
end
