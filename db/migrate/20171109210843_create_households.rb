class CreateHouseholds < ActiveRecord::Migration[5.1]
  def change
    create_table :households do |t|
      t.text :name

      t.timestamps
    end
  end
end
