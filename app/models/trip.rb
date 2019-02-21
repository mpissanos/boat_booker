class Trip < ApplicationRecord
  extend SimpleCalendar
  
  belongs_to :user
  has_one :client, dependent: :destroy
  accepts_nested_attributes_for :client

  validates_presence_of :location, :boat_type, :price, :passengers
# scope method for recent trips
  def self.recent_trips(limit)
    order("created_at desc").limit(limit)
  end
end
