require_relative "string_calculator"

describe StringCalculator do
  subject( :string_calculator ) { StringCalculator.new }
  
  context "#call" do
    it "returns 0 when no numbers are passed" do
      expect( subject.call "" ).to eq 0
    end
    
    it "returns the sum when passed 1 number" do
      expect( subject.call "2" ).to eq 2
    end
    
    it "returns the sum when passed multiple numbers" do
      expect( subject.call "2,3" ).to eq 5
    end
    
    it "handles new lines in the given string" do
      expect( subject.call "4\n6,3" ).to eq 13
    end
    
    it "returns the sum when specifying delimiter" do
       expect( subject.call "//;\n4\n6" ).to eq 10
       expect( subject.call "//;\n4;6" ).to eq 10
    end
    
    it "handles a delimiter of multiple characters" do
      expect( subject.call "//;;;\n4\n6" ).to eq 10
    end
    
    it "raises an error when there are negative numbers" do
      expect{ subject.call "-2, 4, -5" }.to raise_error StringCalculatorError, "Negatives not allowed - [-2, -5]"
    end
    
    it "ignores numbers greater than 1000" do
      expect( subject.call "1002,3" ).to eq 3
    end
  end
end