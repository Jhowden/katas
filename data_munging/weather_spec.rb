require_relative "weather"

describe Weather do
  
  subject( :weather ) { described_class.new "the_file" }
  
  describe "#smallest_temperature_spread" do
    before :each do
      allow( File ).to receive( :readlines ).and_return raw_data
    end
    
    it "calls readlines on the file" do
      subject.smallest_temperature_spread
      
      expect( File ).to have_received( :readlines ).with "the_file"
    end
    
    it "finds the day with the lowest temperature spread" do
      expect( subject.smallest_temperature_spread ).to eq "2"
    end
  end
  
  let( :raw_data ) {
    [
      " Dy MxT   MnT   AvT   HDDay  AvDP\n",
      " ",
      "1  88    59    74          53.8\n",
      "2  79    63    71          46.5\n",
      "3  77    55    66          39.6\n",
      "4  77    59    68          51.1\n"
    ]
  }
end