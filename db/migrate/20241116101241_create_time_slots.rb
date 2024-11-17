class CreateTimeSlots < ActiveRecord::Migration[8.0]
  def change
    create_table :time_slots do |t|
      t.string :slot_time
      t.integer :max_reservations

      t.timestamps
    end
  end
end
