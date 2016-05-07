require './forecast.rb'

f = Forecast.get_weather_for('00688', Time.new(2016,3,25,15,0).to_i)

puts "Coordinated: #{f['latitude']}, #{f['longitude']}"
f['currently'].each_pair {|k,v| puts "#{k}: #{v}"}