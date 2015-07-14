class StringCalculatorError < StandardError
end

class StringCalculator
  
  def call( string )
    return 0 if string.empty?
    delimiter = find_delimiter string
    normalized_string = normalize_string string, delimiter
    numbers = valid_numbers( normalized_string )
    if negative_numbers? numbers
      raise_negative_numbers_error( numbers )
    else
      numbers.reduce( :+ )
    end
  end
  
  private
  
  def normalize_string( string, delimiter )
    string.gsub( "\n", delimiter ).split( delimiter ).map &:to_i
  end
  
  def find_delimiter( string )
    if string.start_with?( "//" )
      delimiters = string.match( /\/\/(.+)/ )[1]
    else
      return ","
    end
  end
  
  def negative_numbers?( numbers )
    numbers.any? { |n| n.abs != n }
  end
  
  def raise_negative_numbers_error( numbers )
    invalid_digits = negatives numbers 
    raise StringCalculatorError, "Negatives not allowed - #{invalid_digits.inspect }"
  end
  
  def negatives( numbers )
    numbers.reject { |n| n.abs == n }
  end
  
  def valid_numbers( numbers )
    numbers.select { |n| n < 1_000 }
  end
end