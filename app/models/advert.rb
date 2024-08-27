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
end
