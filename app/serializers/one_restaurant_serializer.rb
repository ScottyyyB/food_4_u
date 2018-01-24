class OneRestaurantSerializer < ActiveModel::Serializer
  attributes :name, :description, :assortment

  has_many :menus

end

