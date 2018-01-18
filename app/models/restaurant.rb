class Restaurant < ApplicationRecord
  has_many :menus
  has_many :reviews
  validates :name, presence: true
  validates :description, presence: true
end
