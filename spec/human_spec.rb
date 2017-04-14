require "human"

describe Human do
  describe "#choose" do
    context "when all columns are free" do
      it "returns a value between 1 and 7" do
        expect(Human.new("\u26ab").choose.between?(0, 6)).to eq true 
      end
    end

    context "when some columns are filled" do
      it "returns the position of a free column" do
        expect([4, 5, 6].include?(Human.new("\u26ab").choose([4, 5, 6]))).to eq true
      end
    end
  end
end