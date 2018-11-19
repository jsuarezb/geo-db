module Services
  module Postgres
    class Info
      def self.call(lat, lng)
        # TODO: Replace with query
        ActiveRecord::Base.connection.execute('SELECT 1')
      end
    end
  end
end
