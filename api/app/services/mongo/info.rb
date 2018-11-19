module Services
  module Mongo
    class Info
      def self.call(lat, lng)
        # TODO: Replace with query
        MongoDB[:sube]
          .find({
              geometry: {
                '$near' => {
                  '$geometry' => {
                    type: 'Point',
                    coordinates: [lng, lat]
                },
                '$minDistance' => 0,
                '$maxDistance' => 50
              }
            }
          })
          .limit(n)
      end
    end
  end
end
