require_relative "spread_normalizer"

class Football
  include SpreadNormalizer
  REMOVE_TABLE_POSITION = /\d+\./
  REMOVE_DASHES = /-+/
  
  MAX_VALUE_COL = 5
  MIN_VALUE_COL = 6
  
  attr_reader :file_path, :max_value_column, :min_value_column
  
  def initialize( file_path )
    @file_path = file_path
    @max_value_column = MAX_VALUE_COL
    @min_value_column = MIN_VALUE_COL
  end
  
  def smallest_goal_disparity()
    raw_data = File.readlines( file_path )
    
    football_map = populate_map( 
      normalize_data( raw_data ), 
      max_value_column, 
      min_value_column )
    
    determine_smallest_spread football_map
  end
  
  private
  
  def normalize_data( raw_data )
    data = raw_data.map { |l| l.chomp.gsub( REMOVE_TABLE_POSITION, "" ).
      gsub( REMOVE_DASHES, "" ).split( " " ) }.reject { |l| l.empty? }
    remove_headers data
    data
  end
end

# puts Football.new( "football.dat" ).smallest_goal_disparity