module Types
    # In your GraphQL schema definition
# app/graphql/types/time_slot_type.rb
class Types::TimeSlotType < Types::BaseObject
    field :id, ID, null: false
    field :slot_time, String, null: false
    field :max_reservations, Integer, null: false
  end
  
  
  end
  