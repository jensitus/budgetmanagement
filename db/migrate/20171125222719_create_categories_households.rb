class CreateCategoriesHouseholds < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_households do |t|
      t.integer :category_id
      t.integer :household_id
    end
  end
end
