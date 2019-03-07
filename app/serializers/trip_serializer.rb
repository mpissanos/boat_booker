class TripSerializer < ActiveModel::Serializer
  attributes :id, :date, :location, :trip_length, :price, :passengers 
  belongs_to :boat
  belongs_to :user 
  has_one :client
end
