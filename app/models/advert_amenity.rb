class AdvertAmenity < ApplicationRecord
  belongs_to :advert
  belongs_to :amenity

  validates :advert_id, uniqueness: { scope: :amenity_id }
end
