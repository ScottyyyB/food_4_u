class Menu < ApplicationRecord
  has_many :product_categories
  belongs_to :restaurant
  validates :name, presence: true
end
