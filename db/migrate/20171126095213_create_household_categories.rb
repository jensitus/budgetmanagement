class CreateHouseholdCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :household_categories do |t|
      t.integer :household_id
      t.integer :category_id

      t.timestamps
    end
  end
end
