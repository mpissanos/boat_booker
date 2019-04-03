class SimpleTripSerializer < ActiveModel::Serializer
  attributes :date, :location, :passengers, :boat
  
end
