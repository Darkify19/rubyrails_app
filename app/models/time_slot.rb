class TimeSlot < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :slot_time, uniqueness: true, presence: true
  validates :max_reservations, presence: true, numericality: { greater_than: 0 }

  def formatted_slot_time
    slot_time.strftime('%I:%M %p') # Example: "02:00 PM"
  end

  def available?(date)
    reservations.where(reservation_date: date).count < max_reservations
  end
end
