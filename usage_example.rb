require 'ap'
require './forecast.rb'

ap f = Forecast.get_weather_for('00688', Time.new(2016,3,25,15,0).to_i)