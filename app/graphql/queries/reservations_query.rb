module Queries
    class ReservationsQuery < BaseQuery
      description "Fetch all reservations with pagination"
  
      argument :page, Integer, required: false, default_value: 1
      argument :per, Integer, required: false, default_value: 4
  
      type [Types::ReservationType], null: false
  
      def resolve(page:, per:)
        Reservation.order(reservation_date: :desc).page(page).per(per)
      end

      description "Fetch a single reservation by ID"

      argument :id, ID, required: true
  
      type Types::ReservationType, null: false
  
      def resolve(id:)
        Reservation.find(id)
      rescue ActiveRecord::RecordNotFound
        raise GraphQL::ExecutionError, "Reservation not found"
      end
      
    end
  end
  