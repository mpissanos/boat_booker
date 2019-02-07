class Trip < ApplicationRecord
  belongs_to :user
  has_one :client
  accepts_nested_attributes_for :client
end
