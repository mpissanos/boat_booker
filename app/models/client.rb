class Client < ApplicationRecord
 belongs_to :trip

 validates_presence_of :name, :email, :phone_number
end
