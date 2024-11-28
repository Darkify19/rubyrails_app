module Types
# app/graphql/types/reservation_type.rb
class Types::ReservationType < Types::BaseObject
  field :id, ID, null: false
  field :reservation_date, String, null: false
  field :number_of_people, Integer, null: false
  field :status, String, null: false
  field :message, String, null: true
  field :user, Types::UserType, null: false
  field :time_slot, Types::TimeSlotType, null: true
  field :table, Types::TableType, null: true
end

  end
  