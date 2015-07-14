require_relative "spread_normalizer"

class Weather
  include SpreadNormalizer
  
  MAX_VALUE_COL = 1
  MIN_VALUE_COL = 2
  
  attr_reader :file_path, :max_value_column, :min_value_column
  
  def initialize( file_path )
    @file_path = file_path
    @max_value_column = MAX_VALUE_COL
    @min_value_column = MIN_VALUE_COL
  end
  
  def smallest_temperature_spread()
    raw_data = File.readlines file_path
    
    weather_map = populate_map( 
      normalize_data( raw_data ), 
      max_value_column, 
      min_value_column )

    determine_smallest_spread weather_map
  end
end

# puts Weather.new( "weather.dat" ).smallest_temperature_spread