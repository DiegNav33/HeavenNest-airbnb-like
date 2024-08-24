class CreateAdverts < ActiveRecord::Migration[7.1]
  def change
    create_table :adverts do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.integer :max_guests
      t.integer :min_nights
      t.integer :bedrooms
      t.integer :beds
      t.integer :bathrooms
      t.time :check_in
      t.time :check_out
      t.text :house_rules
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
