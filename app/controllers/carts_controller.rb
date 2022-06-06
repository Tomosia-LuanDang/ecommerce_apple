class CartsController < ApplicationController

  def index
    @q = Product.ransack(params[:q])
    @cart_items = current_user.cart.cart_items
    if current_user.present?
      @current_cart = current_user.cart
    else
      @current_cart = Cart.new
    end
  end
end
