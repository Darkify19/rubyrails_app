class AddMessageToReservations < ActiveRecord::Migration[8.0]
  def change
    add_column :reservations, :message, :text
  end
end
