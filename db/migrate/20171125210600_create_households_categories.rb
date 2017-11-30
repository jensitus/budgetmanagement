class CreateHouseholdsCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :households_categories do |t|
      t.integer :household_id
      t.integer :category_id
    end
  end
end
