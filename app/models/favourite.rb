class Favourite < ApplicationRecord
  belongs_to :advert
  belongs_to :user

  validates :user_id, uniqueness: { scope: :advert_id, message: "a déjà ajouté cette annonce en favoris" }
end
