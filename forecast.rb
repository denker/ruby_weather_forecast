require 'forecast_io'
require 'json'

ForecastIO.api_key = '15f564cf2595378303a31ee525059332'

class Forecast

  def self.get_weather_for location, time = nil      
    coords = get_coords(location)
    options = {}
    options[:time] = time.to_i if time
    ForecastIO.forecast( coords["lat"], coords["lng"], options )
  end
  
  private
  
  def self.get_postcodes
    begin
      JSON.parse(File.read('./postcodes.json'))
    rescue
      raise 'ERROR: Cannot read file postcodes.json. Check if file exists and try again.'      
    end
  end
  
  def self.get_coords location
    postcodes = get_postcodes  
    case location.class.to_s
    when "String" # maybe it is postcode
      coords = postcodes[location]      
      raise 'ERROR: postcode not found.' unless coords
    when "Array" # maybe it is coordinates array
      coords = { "lat" => location[0], "lng" => location[1] }      
    end    
    raise 'ERROR: coordiantes array is invalid.' if coords.class != Hash || coords.values.include?(nil)
    raise 'ERROR: coordiantes should be Floats.' if coords["lat"].class != Float || coords["lng"].class != Float
    raise 'ERROR: latitude is out of range.'     if coords["lat"] < -90.0 || coords["lat"] > 90.0  
    raise 'ERROR: longitude is out of range.'    if coords["lng"] < -180.0 || coords["lng"] > 180.0
    coords
  end
  
end