# app/graphql/queries/base_query.rb
module Queries
    class BaseQuery < GraphQL::Schema::Resolver
      # This base query can contain common behavior and methods for all queries.
      # Any queries inheriting from this class will have access to these methods.
      
      # Example: If you need to access the current user, you can add it here
      def current_user
        context[:current_user]
      end
      
      # Example: Add any other common methods for your queries, like authentication checks, etc.
      def require_admin
        raise GraphQL::ExecutionError, "You must be an admin to perform this action" unless current_user&.admin?
      end
    end
  end
  