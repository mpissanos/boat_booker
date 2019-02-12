class Trip < ApplicationRecord
  belongs_to :user
  has_one :client, dependent: :destroy
  accepts_nested_attributes_for :client

  validates_presence_of :location, :boat_type, :price, :passengers
end
