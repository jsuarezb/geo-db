require 'json'
require 'httparty'

th = 50
n = 1
index = 1
spheroid = 0
method = '2dsphere' # distance, within, 2d, 2dsphere
db = 'mongo' # postgres o mongo

localidades = JSON.parse(File.read('../localidades.json'))
total_time = 0
i = 0
coordinates = localidades.map do |l|
  lng = l['geometry']['coordinates'][0]
  lat = l['geometry']['coordinates'][1]

  resp = HTTParty.get("http://localhost:3000/#{db}/nearest?n=#{n}&lat=#{lat}&lng=#{lng}&index=#{index}&th=#{th}&spheroid=#{spheroid}&method=#{method}")
  j = JSON.parse(resp.body)
  total_time += j['query_milliseconds']
  i += 1
  puts i
end

puts total_time
