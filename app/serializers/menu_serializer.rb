class MenuSerializer < ActiveModel::Serializer
  attributes :name
  has_many :product_categories
  belongs_to :restaurant

end