class OrdersController < ApplicationController
  def new
    @q = Product.ransack(params[:q])
    @order_items = current_user.cart.cart_items.includes(:product).latest
    @total_price = total_payment
    @address = current_user.delivery_addresses
  end

  def create
    order = current_user.orders.create!(
      shipping_fee:         params[:shipping_fee].to_f,
      total_payment:        params[:total_payment].to_f,
      payment_method:       params[:payment_method],
      delivery_address_id:  params[:address][-1].to_i,
      cart_id:              current_user.cart.id
    )
    cart_items = current_user.cart.cart_items
    cart_items.map do |cart_item|
      order.order_items.create!(
        price_pay:   cart_item.product.price,
        quantity:    cart_item.quantity,
        total_price: cart_item.total_price,
        product_id:  cart_item.product.id
      )
    end

    CartItem.where(cart_id: current_user.cart.id).delete_all

    redirect_to root_path
    flash[:notice] = "Order success!"
  end
end
