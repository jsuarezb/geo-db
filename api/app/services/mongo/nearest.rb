module Services
  module Mongo
    class Nearest
      def self.call_sphere(lat, lng, n = 10, threshold = 50)
        MongoDB[:sube]
          .find({
            'geometry' => {
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
          .map { |localidad| localidad['geometry']['coordinates'] }
      end

      def self.call_normal(lat, lng, n = 10, threshold = 50)
        MongoDB[:sube]
          .find({
            'geometry.coordinates' => {
              '$near' => [lng, lat],
              '$maxDistance' => threshold / 1000 / 111.12
            }
          })
          .limit(n)
          .map { |localidad| localidad['geometry']['coordinates'] }
      end
    end
  end
end
