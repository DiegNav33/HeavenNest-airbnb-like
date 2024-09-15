class AddSmokingAndPartyToAdverts < ActiveRecord::Migration[7.1]
  def change
    add_column :adverts, :smoking, :boolean
    add_column :adverts, :party, :boolean
  end
end
