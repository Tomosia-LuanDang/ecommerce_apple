class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  layout Proc.new { |controller| controller.devise_controller? ? "users/main" : "application"}
  protected

  def configure_permitted_parameters
    added_attrs = [:name, :phone, :gender, :role, :avatar, :is_active]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def total_payment
    current_user.cart.cart_items.inject(0){ |total_price, item|
      total_price + item.total_price_of_cart_item
    }
  end
end
