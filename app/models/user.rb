class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable

  has_many :adverts
  has_many :favourites
  has_many :reviews
  has_many :bookings # Association pour les réservations effectuées par l'utilisateur
  has_many :reserved_adverts, through: :bookings, source: :advert # Annonces réservées par l'utilisateur
  has_one_attached :profile_picture
end
