require 'json'
require 'httparty'

th = 50
n = 1
index = 1
spheroid = 0
method = 'within' # distance, within, 2d, 2dsphere
db = 'postgres' # postgres o mongo

localidades = JSON.parse(File.read('../localidades.json'))

3.times.each do |a|
  [1, 10, 100].each do |n|
    [50, 1000, 5000, 10000, 50000, 100000].each do |th|
      total_time = 0
      coordinates = localidades.map do |l|
        lng = l['geometry']['coordinates'][0]
        lat = l['geometry']['coordinates'][1]

        resp = HTTParty.get("http://localhost:3000/#{db}/nearest?n=#{n}&lat=#{lat}&lng=#{lng}&index=#{index}&th=#{th}&spheroid=#{spheroid}&method=#{method}")
        j = JSON.parse(resp.body)
        total_time += j['query_milliseconds']
      end

      puts "#{th}, #{n}, #{total_time}"
    end
  end
end
