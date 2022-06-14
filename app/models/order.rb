class Order < ApplicationRecord
  extend Enumerize

  belongs_to :user
  has_many :order_items

  enumerize :payment_method, in: { cash: 0, card: 1 }
  enumerize :status, in: { pending: 0, active: 1, success: 2, reject: 3 }
end
