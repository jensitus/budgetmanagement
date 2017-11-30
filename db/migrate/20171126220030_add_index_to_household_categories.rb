class AddIndexToHouseholdCategories < ActiveRecord::Migration[5.1]
  def change
    add_index :household_categories, [:household_id, :category_id], unique: true
  end
end
