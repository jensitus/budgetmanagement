class CreateExpenseCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :expense_categories do |t|
      t.integer :expense_id
      t.integer :category_id

      t.timestamps
    end
  end
end
