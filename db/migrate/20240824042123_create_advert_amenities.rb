class CreateAdvertAmenities < ActiveRecord::Migration[7.1]
  def change
    create_table :advert_amenities do |t|
      t.references :advert, null: false, foreign_key: true
      t.references :amenity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
