class Boat < ApplicationRecord
  belongs_to :user, inverse_of: :boats
  has_many :trips
  has_many :clients, through: :trips

 def self.within_capacity?
  @boat.capacity >= @trip.passengers
 end
 
end