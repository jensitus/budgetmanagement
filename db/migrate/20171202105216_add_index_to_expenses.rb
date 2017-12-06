class AddIndexToExpenses < ActiveRecord::Migration[5.1]
  def change
    add_index :expenses, :spent_at
  end
end
