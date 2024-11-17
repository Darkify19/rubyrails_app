class TimeSlot < ApplicationRecord
    has_many :reservations, dependent: :destroy
    validates :slot_time, uniqueness: true, presence: true
    validates :max_reservations, presence: true, numericality: { greater_than: 0 }
  end
  