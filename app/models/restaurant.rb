class Restaurant < ApplicationRecord
  VALID_ASSORTMENT = ['Thai', 'Italian', 'Mexican', 'Asian', 'American']
  validates_inclusion_of :assortment, in: VALID_ASSORTMENT
  has_many :menus
  validates :name, presence: true
  validates :description, presence: true
end
