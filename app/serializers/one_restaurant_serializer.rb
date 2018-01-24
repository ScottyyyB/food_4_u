class OneRestaurantSerializer < ActiveModel::Serializer
  attributes :name, :description, :assortment
  attribute :menus

  def menus
    object.menus.map do |menu|
      MenuSerializer.new(menu).as_json
    end
  end
end

