class ProductCategorySerializer < ActiveModel::Serializer
  attributes :name
  attribute :products
  belongs_to :menu

  def products
    object.products.map do |product|
      ProductSerializer.new(product)
    end
  end
end
