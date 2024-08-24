class AddUserToAdverts < ActiveRecord::Migration[7.1]
  def change
    add_reference :adverts, :user, null: false, foreign_key: true
  end
end
