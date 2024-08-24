class Review < ApplicationRecord
  belongs_to :advert
  belongs_to :user
end
