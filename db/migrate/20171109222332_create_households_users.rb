class CreateHouseholdsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :households_users do |t|
      t.integer :household_id
      t.integer :user_id
    end
  end
end
