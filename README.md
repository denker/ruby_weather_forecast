Simple script for fetching weather data from Forecast.io.

= Usage

You will need forecast_io and json gems to use this. Run 'bundle install' to get them.

require './weather.rb'
Forecast.get_weather_for location, time

location: hash or array with coordinates or postcode sting or number.
time: should be passed as UNIX timestamp string, fixnum or Time/DateTime/Date object

e.g.:
 
Forecast.get_weather_for { "lat" => lat, "lng" => lng }, time
Forecast.get_weather_for [lat, lng], time
Forecast.get_weather_for postcode, time
Forecast.get_weather_for postcode

Returns Forecast hash with no changes in data. Description can be found here: https://developer.forecast.io/docs/v2#forecast_call

= Postcodes data

I've taken postcodes with coordinates from https://gist.github.com/erichurst/7882666. It is a bit outdated, but it works for test purposes.
