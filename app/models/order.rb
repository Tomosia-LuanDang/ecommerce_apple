class Order < ApplicationRecord
  extend Enumerize

  belongs_to :user
  has_many :order_items

  enumerize :payment_method, in: { cash: 0, card: 1 }
end
