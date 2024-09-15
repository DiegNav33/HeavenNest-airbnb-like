class RemoveHouseRulesFromAdverts < ActiveRecord::Migration[7.1]
  def change
    remove_column :adverts, :house_rules, :text
  end
end
