module Queries
    class TimeSlotsQuery < BaseQuery
      description "Fetch all time slots"
  
      type [Types::TimeSlotType], null: false
  
      def resolve
        TimeSlot.all
      end
    end
  end
  