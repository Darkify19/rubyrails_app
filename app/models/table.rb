class Table < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :table_number, presence: true, uniqueness: true
  validates :max_capacity, presence: true, numericality: { greater_than: 0 }

  def available?(date, max_reservations)
    reservations_on_date = reservations.where(reservation_date: date).count
    reservations_on_date < max_reservations
  end
end
