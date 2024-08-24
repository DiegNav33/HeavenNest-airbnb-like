class Amenity < ApplicationRecord
  has_many :advert_amenities, dependent: :destroy
  has_many :adverts, through: :advert_amenities
end
