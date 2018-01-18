class Restaurant < ApplicationRecord
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
