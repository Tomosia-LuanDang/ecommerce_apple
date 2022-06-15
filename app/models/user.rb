class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  enum role:   { Admin: 1, User: 0 }
  enum gender: { Male: true, Female: false }

  has_one  :cart
  has_many :delivery_addresses
  has_many :orders
end
