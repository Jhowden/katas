module SpreadNormalizer
  def remove_headers( data )
    data.shift
  end
  
  def determine_smallest_spread( map )
    min_temp = map.values.min
    map.key min_temp
  end
  
  def normalize_data( raw_data )
    data = raw_data.map { |l| l.chomp.split( " " ) }.
      reject { |l| l.empty? }
    remove_headers data
    data
  end
  
  def populate_map( data, max_value_col, min_value_col )
    spread_map = {}
    data.each do |l|
      spread_map[l.first] = l[max_value_col].to_i - l[min_value_col].to_i
    end
    spread_map
  end
end