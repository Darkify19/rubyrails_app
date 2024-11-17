class AddTimeSlotIdToReservations < ActiveRecord::Migration[8.0]
  def change
    add_column :reservations, :time_slot_id, :bigint
    add_foreign_key :reservations, :time_slots
    add_index :reservations, :time_slot_id
  end
end
