class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    create_cart
    if product_exist?
      update_cart_item
    else
      product       = Product.find(params[:product_id])
      total_price = product.price * params[:quantity].to_i
      @current_cart = current_user.cart
      @cart_item =
        @current_cart.cart_items.create!(
          product_id: params[:product_id],
          quantity: params[:quantity],
          total_price_of_cart_item: total_price
        )
    end
  end

  private

  def create_cart
    current_user.create_cart! if current_user.cart.blank?
  end

  def update_cart_item
    product = Product.find(params[:product_id])
    cart_item.increment!(:quantity, params[:quantity].to_i)
    cart_item.increment!(:total_price_of_cart_item, params[:quantity].to_i * product.price)
  end

  def product_exist?
    cart_item.present?
  end

  def cart_item
    @cart_item ||= current_user.cart.cart_items.find_by(product_id: params[:product_id])
  end
end
