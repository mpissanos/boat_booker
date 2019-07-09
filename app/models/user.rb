class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  
  has_many :trips
  has_many :boats, inverse_of: :user
  has_many :clients, through: :trips
end
