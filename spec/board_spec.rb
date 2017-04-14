require "board"

describe Board do
  subject(:board) do
      Board.new
  end

  describe "#available_spaces" do
    context "when the board is empty" do
      it "returns [0, 1, 2, 3, 4, 5, 6]" do
        expect(board.available_spaces).to eq([0, 1, 2, 3, 4, 5, 6])
      end
    end

    context "when the board has a full column" do
      it "returns all indicies minus the indicies of the filled column" do
        board.instance_variable_set(
          :@board, [["\u26aa", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                    ["\u26aa", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                    ["\u26aa", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                    ["\u26aa", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                    ["\u26aa", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                    ["\u26aa", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"]]
                                   )
        expect(board.available_spaces).to eq([1, 2, 3, 4, 5, 6])
      end
    end

    context "when the board is full" do
      it "returns an empty array" do
        board.instance_variable_set(
          :@board, [["\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa"], 
                    ["\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa"], 
                    ["\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa"], 
                    ["\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa"], 
                    ["\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa"], 
                    ["\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa"]]
                                   )
        expect(board.available_spaces).to eq([])
      end
    end
  end

  describe "#add" do
    context "with piece: \u26aa, index: 0, and column 0 empty" do
      it "should change the bottom most entry in column 0" do
        expect { board.add("\u26aa", 0) }.to change { board.instance_variable_get(:@board)[5][0] }.from("\u26b3").to("\u26aa")
      end
    end

    context "with piece \u26aa, index: 1, and column 1 partially filled" do
      it "should change the lowest possible entry in column 1" do
        board.instance_variable_set(
          :@board, [["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                    ["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                    ["\u26b3", "\u26ab", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                    ["\u26b3", "\u26aa", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                    ["\u26b3", "\u26ab", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                    ["\u26b3", "\u26aa", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"]]
                                   )
        expect { board.add("\u26aa", 1) }.to change { board.instance_variable_get(:@board)[1][1] }.from("\u26b3").to("\u26aa")
      end
    end
  end

  describe "#print_board" do
    context "when the board is empty" do
      it "prints an empty board" do
        expect { board.print_board }.to output("\u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \n" \
                                               "\u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \n" \
                                               "\u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \n" \
                                               "\u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \n" \
                                               "\u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \n" \
                                               "\u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \n\n").to_stdout
      end
    end

    context "when the board is partially filled" do
      it "prints the filled board" do
        board.instance_variable_set(
          :@board, [["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                    ["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
                    ["\u26b3", "\u26ab", "\u26b3", "\u26aa", "\u26b3", "\u26b3", "\u26b3"], 
                    ["\u26b3", "\u26aa", "\u26aa", "\u26ab", "\u26b3", "\u26b3", "\u26b3"], 
                    ["\u26b3", "\u26aa", "\u26ab", "\u26ab", "\u26b3", "\u26b3", "\u26b3"], 
                    ["\u26aa", "\u26ab", "\u26ab", "\u26aa", "\u26aa", "\u26b3", "\u26b3"]]
                                   )
        expect { board.print_board }.to output("\u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \n" \
                                               "\u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \u26b3 \n" \
                                               "\u26b3 \u26ab \u26b3 \u26aa \u26b3 \u26b3 \u26b3 \n" \
                                               "\u26b3 \u26aa \u26aa \u26ab \u26b3 \u26b3 \u26b3 \n" \
                                               "\u26b3 \u26aa \u26ab \u26ab \u26b3 \u26b3 \u26b3 \n" \
                                               "\u26aa \u26ab \u26ab \u26aa \u26aa \u26b3 \u26b3 \n\n").to_stdout
      end
    end
  end     
end