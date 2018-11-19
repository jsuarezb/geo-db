module Services
  module Postgres
    class Nearest
      def self.distance(lat, lng, n = 10, with_index = true, threshold = 50.0, spheroid = false)
        suffix = with_index ? 'con' : 'sin'
        query = <<-SQL
          SELECT
            s.localidad  as sube,
            ST_X(s.geom) as lng,
            ST_Y(s.geom) as lat,
            ST_Distance(
                geography(ST_MakePoint(#{lng}, #{lat})),
                geography(s.geom),
                #{spheroid}
            )            as dist
          FROM sube_#{suffix}_index s
          WHERE ST_Distance(
              geography(ST_MakePoint(#{lng}, #{lat})),
              geography(s.geom),
              #{spheroid}
          ) <= #{threshold}
          ORDER BY dist ASC
          LIMIT #{n};
        SQL

        ActiveRecord::Base.connection.execute(query)
      end

      def self.within(lat, lng, n = 10, with_index = true, threshold = 50.0, spheroid = false)
        suffix = with_index ? 'con' : 'sin'
        query = <<-SQL
          SELECT
            s.localidad  as sube,
            ST_X(s.geom) as lng,
            ST_Y(s.geom) as lat,
            ST_Distance(
                geography(ST_MakePoint(#{lng}, #{lat})),
                geography(s.geom),
                #{spheroid}
            )            as dist
          FROM sube_#{suffix}_index s
          WHERE ST_DWithin(
              geography(ST_MakePoint(#{lng}, #{lat})),
              geography(s.geom),
              #{threshold},
              #{spheroid}
          )
          ORDER BY dist ASC
          LIMIT #{n};
        SQL

        ActiveRecord::Base.connection.execute(query)
      end
    end
  end
end
