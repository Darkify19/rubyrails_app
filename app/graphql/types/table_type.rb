module Types
    class TableType < BaseObject
      field :id, ID, null: false
      field :table_number, Integer, null: false
      field :max_capacity, Integer, null: false
      field :reservations, [Types::ReservationType], null: true  # Reservations for this table
    end
  end
  