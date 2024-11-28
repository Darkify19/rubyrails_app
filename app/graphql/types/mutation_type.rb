module Types
  class MutationType < BaseObject
    field :create_reservation, Types::ReservationType, null: false do
      argument :reservation_date, String, required: true
      argument :time_slot_id, ID, required: true
      argument :table_id, ID, required: true
      argument :number_of_people, Integer, required: true
    end

    def create_reservation(reservation_date:, time_slot_id:, table_id:, number_of_people:)
      reservation = Reservation.new(
        reservation_date: reservation_date,
        time_slot_id: time_slot_id,
        table_id: table_id,
        number_of_people: number_of_people,
        user: context[:current_user]  # Assuming you're adding the current_user to the context for auth
      )

      if reservation.save
        reservation
      else
        GraphQL::ExecutionError.new(reservation.errors.full_messages.join(", "))
      end
    end
  end
end
