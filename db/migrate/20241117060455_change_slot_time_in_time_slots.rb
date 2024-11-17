class ChangeSlotTimeInTimeSlots < ActiveRecord::Migration[8.0]
  def change
    change_column :time_slots, :slot_time, :time, using: 'slot_time::time'
  end
end
