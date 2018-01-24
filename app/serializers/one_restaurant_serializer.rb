class OneRestaurantSerializer < ActiveModel::Serializer
  attributes :name, :description, :assortment

  has_many :menus

  #def menus
    #binding.pry
    #object.menus.map do |menu|

    #end
  #end
end
