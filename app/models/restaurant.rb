class Restaurant < ApplicationRecord
  VALID_ASSORTMENT = ['Thai', 'Italian', 'Mexican', 'Asian', 'American']
  validates_inclusion_of :assortment, in: VALID_ASSORTMENT
  has_many :menus
  validates :name, :description, :street_address, :post_code, :city, presence: true
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    Geocoder.address([self.street_address,
                      self.post_code,
                      self.city].join(','))
  end
end
