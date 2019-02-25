class Client < ApplicationRecord
 belongs_to :trip
 belongs_to :boat
 validates_presence_of :name, :email, :phone_number
end
