class Advert < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :favourites
  has_many :reviews
  has_many :advert_amenities, dependent: :destroy
  has_many :amenities, through: :advert_amenities
  has_many :bookings # Association pour les réservations liées à l'annonce
  has_many :reservations, through: :bookings, source: :user # Utilisateurs ayant réservé cette annonce
  has_many_attached :images

  validates :title, presence: true, length: { maximum: 70}
  validates :description, presence: true, length: { maximum: 350}
  validates :price, :max_guests, :min_nights, :bedrooms, :beds, :bathrooms, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :check_in, :check_out, :house_rules, :address, :city, :state, :postal_code, :country, :category_id, presence: true
  validate :validate_amenities_count
  validate :at_least_one_image
  validate :validate_images_count

  private

  def validate_amenities_count
    if amenity_ids.size < 2
      errors.add(:amenity_ids, "must select at least 2 amenities")
    end
  end

  def at_least_one_image
    if images.blank? || images.size < 3
      errors.add(:images, "must have at least three images")
    end
  end

  def validate_images_count
    if images.size > 8
      errors.add(:images, "You can upload a maximum of 8 images")
    end
  end
end
