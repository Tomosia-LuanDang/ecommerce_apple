class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  enum payment_method:   { "Cash on Delivery": 0, "Payment Online": 1 }
end
