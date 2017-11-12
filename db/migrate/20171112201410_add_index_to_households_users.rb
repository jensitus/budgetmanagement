class AddIndexToHouseholdsUsers < ActiveRecord::Migration[5.1]
  def change
    add_index :households_users, [:household_id, :user_id], unique: true
  end
end
