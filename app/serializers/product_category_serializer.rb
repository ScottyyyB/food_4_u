class ProductCategorySerializer < ActiveModel::Serializer
  attributes :name
  belongs_to :menu
end
