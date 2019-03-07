class Trip < ApplicationRecord
  belongs_to :boat
  belongs_to :user
  has_one :client, dependent: :destroy
  accepts_nested_attributes_for :client

  validates_presence_of :location, :trip_length, :price, :passengers

  # scope method for recent trips

  # def self.set_boat_id

  # end
  

  def self.recent_trips
    order("created_at desc").limit(5)
  end

  def self.after_today?
    where("created_at >=?", Time.zone.today.beginning_of_day)
  end

end
