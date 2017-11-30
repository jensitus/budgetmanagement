class AddIndexToExpenseCategories < ActiveRecord::Migration[5.1]
  def change
    add_index :expense_categories, [:expense_id, :category_id], unique: true
  end
end
