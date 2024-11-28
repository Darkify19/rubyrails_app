module Types
    class UserType < BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :email, String, null: false
      field :reservations, [Types::ReservationType], null: true  # User's reservations
    end
  end
  