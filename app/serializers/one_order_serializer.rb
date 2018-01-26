class OneOrderSerializer < ActiveModel::Serializer
  attribute :order_items

  def order_items
    object.order_items.map do |item|
      OrderItemSerializer.new(item)
    end
  end
end
