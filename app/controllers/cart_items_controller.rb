class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    if product_exist?
      update_cart_item
    else
      product       = Product.find(params[:product_id])
      total_price = product.price * params[:quantity].to_i
      @cart_item =
        current_cart.cart_items.create!(
          product_id: params[:product_id],
          quantity: params[:quantity],
          total_price_of_cart_item: total_price
        )
    end
  end

  def update
    cart_item.update!(
      quantity: params[:quantity].to_i,
      total_price_of_cart_item: params[:quantity].to_i * cart_item.product.price
    )
    @total_payment = total_payment
  end

  def destroy
    CartItem.find(params[:id]).delete
    @cart_items = current_user.cart.cart_items.latest
    @total_payment = total_payment
  end

  private

  def current_cart
    @current_cart ||= current_user.cart || current_user.create_cart!
  end

  def update_cart_item
    cart_item.increment!(:quantity, params[:quantity].to_i)
    cart_item.increment!(:total_price_of_cart_item, params[:quantity].to_i * cart_item.product.price)
  end

  def product_exist?
    cart_item.present?
  end

  def cart_item
    @cart_item ||= current_cart.cart_items.find_by(product_id: params[:product_id])
  end
end
