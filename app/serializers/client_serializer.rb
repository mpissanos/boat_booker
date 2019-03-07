class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone_number
  belongs_to :trip
end
