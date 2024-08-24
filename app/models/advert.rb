class Advert < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :favourites
  has_many :reviews
  has_many :advert_amenities, dependent: :destroy
  has_many :amenities, through: :advert_amenities
end
