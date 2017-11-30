class DropCreateHouseholdsCategories < ActiveRecord::Migration[5.1]
  def change
    drop_table :households_categories
  end
end
