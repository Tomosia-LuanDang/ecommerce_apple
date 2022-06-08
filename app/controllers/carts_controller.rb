class CartsController < ApplicationController

  def index
    @q = Product.ransack(params[:q])
    @cart_items = current_user.cart.cart_items.includes(:product).latest
    if current_user.present?
      @current_cart = current_user.cart
    else
      @current_cart = Cart.new
    end
    @total_payment = total_payment
  end


end
