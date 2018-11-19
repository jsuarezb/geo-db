module Services
  module Mongo
    class Info
      def self.call(lat, lng)
        # TODO: Replace with query
        MongoDB[:localidades]
          .find()
          .first
      end
    end
  end
end
