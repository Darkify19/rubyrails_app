module Queries
    class UsersQuery < BaseQuery
      description "Fetch all users"
  
      type [Types::UserType], null: false
  
      def resolve
        User.all
      end
    end
  end
  