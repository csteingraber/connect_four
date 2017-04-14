require "game"

describe Game do
  let(:game) do
    Game.new
  end

  describe "#check_victory?" do
    subject(:board) do
      board = double("board")
    end 

    context "when there are 4 in a row" do
      it "returns true" do
        allow(board).to receive(:board).and_return([["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                                                    ["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                                                    ["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                                                    ["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                                                    ["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                                                    ["\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26b3", "\u26b3", "\u26b3"]])
        allow(Board).to receive(:new).and_return(board)
        expect(game.instance_eval { check_victory? }).to eq [true, "\u26aa"]
      end

      it "returns true" do
        allow(board).to receive(:board).and_return([["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                                                    ["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                                                    ["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                                                    ["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                                                    ["\u26b3", "\u26b3", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26b3"], 
                                                    ["\u26b3", "\u26aa", "\u26b3", "\u26aa", "\u26b3", "\u26aa", "\u26aa"]])
        allow(Board).to receive(:new).and_return(board)
        expect(game.instance_eval { check_victory? }).to eq [true, "\u26aa"]
      end      
    end

    context "when there are 4 in a column" do
      it "returns true" do
        allow(board).to receive(:board).and_return([["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                                                    ["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                                                    ["\u26aa", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                                                    ["\u26aa", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                                                    ["\u26aa", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                                                    ["\u26aa", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"]])
        allow(Board).to receive(:new).and_return(board)
        expect(game.instance_eval { check_victory? }).to eq [true, "\u26aa"]
      end

      it "returns true" do
        allow(board).to receive(:board).and_return([["\u26b3", "\u26b3", "\u26b3", "\u26aa", "\u26aa", "\u26b3", "\u26b3"], 
                                                    ["\u26b3", "\u26b3", "\u26b3", "\u26aa", "\u26aa", "\u26b3", "\u26b3"], 
                                                    ["\u26b3", "\u26b3", "\u26b3", "\u26aa", "\u26aa", "\u26b3", "\u26b3"], 
                                                    ["\u26b3", "\u26b3", "\u26b3", "\u26ab", "\u26aa", "\u26b3", "\u26b3"], 
                                                    ["\u26b3", "\u26b3", "\u26aa", "\u26aa", "\u26ab", "\u26aa", "\u26b3"], 
                                                    ["\u26b3", "\u26aa", "\u26b3", "\u26aa", "\u26aa", "\u26aa", "\u26ab"]])
        allow(Board).to receive(:new).and_return(board)
        expect(game.instance_eval { check_victory? }).to eq [true, "\u26aa"]
      end      
    end

    context "when there are 4 in a diagonal" do
      it "returns true" do
        allow(board).to receive(:board).and_return([["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                                                    ["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                                                    ["\u26b3", "\u26b3", "\u26b3", "\u26aa", "\u26b3", "\u26b3", "\u26b3"], 
                                                    ["\u26b3", "\u26b3", "\u26aa", "\u26ab", "\u26b3", "\u26b3", "\u26b3"], 
                                                    ["\u26b3", "\u26aa", "\u26ab", "\u26ab", "\u26b3", "\u26b3", "\u26b3"], 
                                                    ["\u26aa", "\u26ab", "\u26ab", "\u26ab", "\u26b3", "\u26b3", "\u26b3"]])
        allow(Board).to receive(:new).and_return(board)
        expect(game.instance_eval { check_victory? }).to eq [true, "\u26aa"]
      end

      it "returns true" do
          allow(board).to receive(:board).and_return([["\u26aa", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                                                      ["\u26ab", "\u26aa", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                                                      ["\u26aa", "\u26aa", "\u26aa", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                                                      ["\u26ab", "\u26ab", "\u26ab", "\u26aa", "\u26b3", "\u26b3", "\u26b3"], 
                                                      ["\u26ab", "\u26ab", "\u26ab", "\u26aa", "\u26b3", "\u26b3", "\u26b3"], 
                                                      ["\u26ab", "\u26ab", "\u26ab", "\u26aa", "\u26b3", "\u26b3", "\u26b3"]])
          allow(Board).to receive(:new).and_return(board)
          expect(game.instance_eval { check_victory? }).to eq [true, "\u26aa"]
      end

      it "returns true" do
          allow(board).to receive(:board).and_return([["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                                                      ["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26aa", "\u26b3", "\u26b3"], 
                                                      ["\u26b3", "\u26b3", "\u26b3", "\u26aa", "\u26aa", "\u26b3", "\u26b3"], 
                                                      ["\u26b3", "\u26b3", "\u26aa", "\u26ab", "\u26aa", "\u26b3", "\u26b3"], 
                                                      ["\u26b3", "\u26aa", "\u26aa", "\u26aa", "\u26ab", "\u26b3", "\u26b3"], 
                                                      ["\u26b3", "\u26aa", "\u26aa", "\u26aa", "\u26ab", "\u26b3", "\u26b3"]])
          allow(Board).to receive(:new).and_return(board)
          expect(game.instance_eval { check_victory? }).to eq [true, "\u26aa"]
      end
    end
  end
end