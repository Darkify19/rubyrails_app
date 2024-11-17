class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :table
  belongs_to :time_slot

  validates :reservation_date, presence: true
  validates :number_of_people, presence: true, numericality: { greater_than: 0 }
  validates :status, inclusion: { in: %w[pending confirmed canceled] }

  # Custom validation: Ensure reservations are made at least 2 hours in advance
  validate :reservation_time_is_in_advance

  private

  def reservation_time_is_in_advance
    if reservation_date && reservation_date < 2.hours.from_now.to_date
      errors.add(:reservation_date, "must be at least 2 hours in advance")
    end
  end
end
