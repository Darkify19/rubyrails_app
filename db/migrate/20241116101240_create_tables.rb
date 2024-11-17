class CreateTables < ActiveRecord::Migration[8.0]
  def change
    create_table :tables do |t|
      t.integer :table_number
      t.integer :max_capacity

      t.timestamps
    end
  end
end