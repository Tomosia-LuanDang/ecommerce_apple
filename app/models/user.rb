class User < ApplicationRecord
  extend Enumerize

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  enum role:   { admin: 1, user: 0 }
  enumerize :gender, in: { male: true, female: false }

  mount_uploader :avatar, PictureUploader

  has_one  :cart
  has_many :delivery_addresses
  has_many :orders
end
