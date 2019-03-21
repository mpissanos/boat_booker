class Trip < ApplicationRecord
  belongs_to :boat
  belongs_to :user
  has_one :client, dependent: :destroy
  accepts_nested_attributes_for :client

  validates_presence_of :location, :price, :passengers, :start_time, :end_time,

  # scope method for recent trips

  # def self.set_boat_id

  # end
  

  def self.recent_trips(number)
    order("created_at desc").limit(number)
  end

  def self.after_today?
    where("created_at >=?", Time.zone.today.beginning_of_day)
  end

  def self.format_time
    to_s(:time)
  end
end
