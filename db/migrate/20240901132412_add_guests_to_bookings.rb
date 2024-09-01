class AddGuestsToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :total_guests, :integer
  end
end
