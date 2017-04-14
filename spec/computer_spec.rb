require "computer"

describe Computer do
  describe "#choose" do
    subject(:computer) do
      Computer.new("\u26aa")
    end

    context "when all columns are free" do
      it "returns a value between 0 and 6" do
        expect(computer.choose.between?(0, 6)).to eq true 
      end
    end

    context "when some columns are filled" do
      it "returns the position of a free column" do
        expect([3, 2, 5].include?(computer.choose([3, 2, 5]))).to eq true
      end
    end

    context "when the board is full" do
      it "returns nil" do
        expect(computer.choose([])).to eq(nil)
      end
    end
  end
end