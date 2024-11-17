class CreateReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :table, null: false, foreign_key: true
      t.date :reservation_date
      t.string :time_slot
      t.integer :number_of_people
      t.string :status

      t.timestamps
    end
  end
end
