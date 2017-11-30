class DropJoinHouseholdUsers < ActiveRecord::Migration[5.1]
  def change
    drop_table :join_households_users
  end
end
