class TimeSlot < ApplicationRecord
    has_many :reservations, dependent: :destroy
    validates :slot_time, uniqueness: true, presence: true
    validates :max_reservations, presence: true, numericality: { greater_than: 0 }

    def formatted_slot_time
      slot_time.strftime("%I:%M %p")
    end
  end
  