class AddAvailabilityToTables < ActiveRecord::Migration[8.0]
  def change
    add_column :tables, :availability, :boolean, default: true, null: false
  end
end
