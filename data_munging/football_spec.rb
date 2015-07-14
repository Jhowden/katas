require_relative "football"

describe Football do
  
  subject( :football ) { described_class.new "the_file" }
  
  describe "#smalles_goal_disparity" do
    before :each do
      allow( File ).to receive( :readlines ).and_return raw_data
    end
    
    it "reads the file" do
      subject.smallest_goal_disparity
      
      expect( File ).to have_received( :readlines ).with "the_file"
    end
    
    it "returns the team with smallest goal disparity" do
      expect( subject.smallest_goal_disparity ).to eq "Liverpool"
    end
  end
  
  let( :raw_data ) do
    [
      "Team            P     W    L   D    F      A     Pts",
      "1. Arsenal         38    26   9   3    79  -  36    87\n",
      "2. Liverpool       38    24   8   6    67  -  30    80\n",
      "3. Manchester_U    38    24   5   9    87  -  45    77\n",
      "-------------------------------------------------------\n"
    ]
  end
end