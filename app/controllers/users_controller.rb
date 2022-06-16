class UsersController < ApplicationController
  def show
    @q       = Product.ransack(params[:q])
    @address = current_user.delivery_addresses
  end

  def update
    current_user.update!(user_params)
    redirect_to user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :email, :name, :image, :phone, :gender)
  end
end
