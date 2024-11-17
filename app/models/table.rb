class Table < ApplicationRecord
    has_many :reservations, dependent: :destroy
    validates :table_number, uniqueness: true, presence: true
    validates :max_capacity, presence: true, numericality: { greater_than: 0 }
  end
  