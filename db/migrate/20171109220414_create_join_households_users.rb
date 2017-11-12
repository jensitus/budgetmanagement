class CreateJoinHouseholdsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :join_households_users do |t|
      t.integer :household_id
      t.integer :user_id
    end
  end
end
