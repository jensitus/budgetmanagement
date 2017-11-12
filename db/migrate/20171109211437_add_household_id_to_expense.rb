class AddHouseholdIdToExpense < ActiveRecord::Migration[5.1]
  def change
    add_column :expenses, :household_id, :integer
  end
end
