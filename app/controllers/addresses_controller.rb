class AddressesController < ApplicationController
  def new
    @q = Product.ransack(params[:q])
    @address = DeliveryAddress.new
    @current_cart = current_user.cart
  end

  def create
    @q = Product.ransack(params[:q])
    @address = current_user.delivery_addresses.new(address_params)
    if @address.save
      redirect_to current_user
      flash[:notice] = "Create address success!"
    else
      render :new
    end
  end

  private

  def address_params
    params.require(:delivery_address).permit(:name, :phone, :address)
  end
end
