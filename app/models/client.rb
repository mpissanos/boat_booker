class Client < ApplicationRecord
  has_many :trips
  has_many :users, through: :trips
  # accepts_nested_attributes_for :trips
end
