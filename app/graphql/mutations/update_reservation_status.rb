# app/graphql/mutations/update_reservation_status.rb
module Mutations
    class UpdateReservationStatus < BaseMutation
      argument :id, ID, required: true
      argument :status, String, required: true
  
      field :reservation, Types::ReservationType, null: false
  
      def resolve(id:, status:)
        reservation = Reservation.find(id)
        if reservation.update(status: status)
          { reservation: reservation }
        else
          raise GraphQL::ExecutionError, "Failed to update reservation status"
        end
      end
    end
  end
  