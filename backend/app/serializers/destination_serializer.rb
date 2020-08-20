class DestinationSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :borough, :detail
  has_many :comments
end
