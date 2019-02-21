class Boat < ApplicationRecord
 
  belongs_to :user
  has_many :trips, optional: true
  has_many :clients, through: :trips
  accepts_nested_attributes_for :trips

end