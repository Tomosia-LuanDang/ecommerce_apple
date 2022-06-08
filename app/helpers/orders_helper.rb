module OrdersHelper
  def option_for_payment
    [Order.payment_methods.keys.first, Order.payment_methods.keys.second]
  end

  def option_for_address
    current_user.delivery_addresses.map do |item|
      "Address #{item.id}"
    end
  end
end
