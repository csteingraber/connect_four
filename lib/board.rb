# This class contains the Connect Four board
# in the form of a 2D Array with unicode characters
# as the elements. It contains the functionality
# to create an empty board, print the current board,
# add to the board, and clear the board.
class Board

  attr_reader :board

  # Creates a 2D Array of unicode characters 
  # representing the board.
  def initialize
    @board = [["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
              ["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
              ["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
              ["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
              ["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"], 
              ["\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3", "\u26b3"]]
  end

  # Returns an array whose elements correspond to
  # the indexes of the open columns on the board.
  def available_spaces
    open_spaces = []
    @board.first.each_with_index do |element, index|
      open_spaces << index if element == "\u26b3" 
    end
    open_spaces
  end

  # Changes the lowest possible point in the column
  # specified by index to the unicode value referenced 
  # by piece. 
  def add(piece, index)
    @board.each_with_index do |row, position|
      if (row[index] != "\u26b3") || (position == 5)
        row[index] == "\u26b3" ? row[index] = piece : @board[position-1][index] = piece
        break
      end
    end
  end

  def print_board
    @board.each do |row|
      row.each { |element| print "#{element} " }
      puts ""
    end
    puts ""
  end
end