class User < ActiveRecord::Base
  validates :name, :email, presence: :true
  validates :email, uniqueness: :true
  has_secure_password
  has_many :orders
  has_many :products
end
