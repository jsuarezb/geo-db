module Services
  module Mongo
    class Nearest
      def self.call(lat, lng, n = 10)
        # TODO: replace with query
        MongoDB[:localidades]
          .find({
            'geometry.coordinates' => {
              '$near' => {
                '$geometry' => {
                  type: 'Point',
                  coordinates: [lng, lat]
                }
              }
            }
          })
          .limit(n)
          .map { |localidad| localidad['geometry']['coordinates'] }
        # [[54.36, 32.2], [54.33, 32.8]]
      end
    end
  end
end
