class ProductCategorySerializer < ActiveModel::Serializer
  attributes :name
  attribute :products
  belongs_to :menu

end
