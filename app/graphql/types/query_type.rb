# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :all_reservations, [Types::ReservationType], null: false, description: "Fetch all reservations" do
      argument :page, Integer, required: false, default_value: 1
      argument :per, Integer, required: false, default_value: 4
    end

    field :reservation, Types::ReservationType, null: false, description: "Fetch a reservation by ID" do
      argument :id, ID, required: true
    end

    field :all_users, [Types::UserType], null: false, description: "Fetch all users"
    field :all_tables, [Types::TableType], null: false, description: "Fetch all tables"
    field :all_time_slots, [Types::TimeSlotType], null: false, description: "Fetch all time slots"

    def all_reservations(page:, per:)
      Reservation.order(reservation_date: :desc).page(page).per(per)
    end

    def reservation(id:)
      Reservation.find(id)
    end

    def all_users
      User.all
    end

    def all_tables
      Table.all
    end

    def all_time_slots
      TimeSlot.all
    end
    
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
  end
end
