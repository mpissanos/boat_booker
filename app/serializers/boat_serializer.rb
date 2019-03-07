class BoatSerializer < ActiveModel::Serializer
  attributes :id, :boat_type, :name, :capacity
  has_many :trips
end
