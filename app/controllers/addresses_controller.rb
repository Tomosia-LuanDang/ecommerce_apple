class AddressesController < ApplicationController
  def new
    @q = Product.ransack(params[:q])
    @address = DeliveryAddress.new
  end

  def create
    current_user.delivery_addresses.create!(address_params)
    redirect_to current_user
  end

  private

  def address_params
    params.require(:delivery_address).permit(:name, :phone, :address)
  end
end
