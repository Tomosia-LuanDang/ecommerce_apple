class Product < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :category
  has_many :cart_items

  scope :product_residual, -> { where("residual > ?", 0) }
end
