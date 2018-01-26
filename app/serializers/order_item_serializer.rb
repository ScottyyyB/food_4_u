class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :price_cents, :price_currency
  attribute :item

  def item
    ProductSerializer.new(object.item)
  end
end
