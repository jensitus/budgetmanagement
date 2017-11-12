class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.decimal :amount
      t.text :description
      t.datetime :spent_at

      t.timestamps
    end
  end
end
