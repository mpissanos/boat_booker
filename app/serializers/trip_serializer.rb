class TripSerializer < ActiveModel::Serializer
  
  attributes :id, :title, :date, :location, :price, :passengers, :start, :end, :url
  belongs_to :boat
  belongs_to :user 
  has_one :client

  def title
    object.location
  end

  def url
    "/trips/" + object.id.to_s
  end

  def start
    "#{object.date} #{object.start_time.to_s(:time)}"
  end

  def end
    "#{object.date} #{object.end_time.to_s(:time)}"
  end
end
