module Queries
    class TablesQuery < BaseQuery
      description "Fetch all tables"
  
      type [Types::TableType], null: false
  
      def resolve
        Table.all
      end
    end
  end
  