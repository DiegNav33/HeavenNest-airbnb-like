class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :advert

  validates :start_date, :end_date, :total_guests, presence: true
  validate :end_date_after_start_date

  before_save :calculate_total_price


  private

  def end_date_after_start_date
    if end_date <= start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def calculate_total_price
    return if start_date.blank? || end_date.blank?

    days = (end_date - start_date).to_i
    self.total_price = days * advert.price if advert && days > 0
  end
end
