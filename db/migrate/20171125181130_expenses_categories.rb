class ExpensesCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses_categories do |t|
      t.integer :expense_id
      t.integer :category_id
    end
  end
end
