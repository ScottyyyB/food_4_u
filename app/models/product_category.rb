class ProductCategory < ApplicationRecord
  belongs_to :menu
  has_many :products
  validates :name, presence: true
end
