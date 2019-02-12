class Client < ApplicationRecord
 belongs_to :trip, required: true

 validates_presence_of :name, :email, :phone_number
end
