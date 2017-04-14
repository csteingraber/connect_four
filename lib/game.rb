require "board"
require "human"
require "computer"

# This class acts as the container for all
# componenets of the game: the board, the human 
# player, and the computer. It also provides
# the functionality of starting , playing, and
# finishing a round of Connect Four.
class Game
  def initialize
    @board = Board.new
    response = ""
    until (response == 'black') || (response == 'white')
      puts "black' piece or 'white' piece?\n\n"
      response = gets.chomp.downcase
      puts ""
    end
    @human = response == "black" ? Human.new("\u26ab") : Human.new("\u26aa")
    @computer = response == "black" ? Computer.new("\u26aa") : Computer.new("\u26ab")
  end

  def start
    victory = [false]
    until victory[0] || @board.available_spaces.size == 0
      @board.print_board
      @board.add(@human.color, @human.choose(@board.available_spaces))
      victory = check_victory?
      unless victory[0]
        @board.add(@computer.color, @computer.choose(@board.available_spaces))
        victory = check_victory?
      end
      @board.print_board
    end

    if victory[0] && victory[1] == @human.color
      puts "YOU WIN!"
    elsif victory[0] && victory[1] == @computer.color
      puts "COMPUTER WINS!"
    else
      puts "GAME OVER"
    end
  end

  private

  def check_victory?
    array = []
    array << four_in_a_row? << four_in_a_column? << four_in_a_diagonal?
    array.each { |pair| return pair if pair[0] == true }
    return [false]
  end

  def four_in_a_row? 
    @board.board.each do |row|
      answer = check_row?(row)
      return answer if answer[0]
    end
    return [false]
  end

  def four_in_a_column?
    7.times do |column|
      answer = check_column?(column)
      return answer if answer[0]
    end
    return [false]
  end

  def four_in_a_diagonal?
    board = @board.board
    3.times do |row| # Only check the top 3 rows in a top-down
                     # fashion for diagonals. It is pointless 
                     # to check below those rows since there is
                     # only enough room for 3 in a diagonal when 
                     # checking that low in a top-down fashion.
      board[row].each_with_index do |element, column| 
        if element != "\u26b3" && column < 3
          answer = check_left_to_right?(row, column)
          return answer if answer[0]
        elsif element != "\u26b3" && column == 3
          answer = check_left_to_right?(row, column)
          return answer if answer[0]
          answer = check_right_to_left?(row, column)
          return answer if answer[0]
        elsif element != "\u26b3" && column > 3
          answer = check_right_to_left?(row, column)
          return answer if answer[0]
        end
      end
    end
    return [false]
  end

  # Checks a given row for 4 consecutive
  # pieces and returns true or false accordingly.
  def check_row?(row)
    current_piece = ""
    number_of_occurences = 0
    row.each_with_index do |element, index|
      if element != "\u26b3" && current_piece.empty?
        current_piece = element
        number_of_occurences = 1
      elsif element != "\u26b3" && element == current_piece
        number_of_occurences += 1
        return [true, current_piece] if number_of_occurences == 4
      elsif element != "\u26b3" && element != current_piece
        return [false] if index > 3 # Don't continue to check the rest 
                                  # of the row if you're more than halfway 
                                  # through it and the color changes.
        current_piece = element
        number_of_occurences = 1
      else
        return [false] if index >= 3 # Don't continue to check the rest 
                                   # of the row if you're more than halfway 
                                   # through it and there are only empty spaces.
        current_piece = ""
      end
    end
  end

  # Checks a given column for 4 consecutive
  # pieces and returns true or false accordingly.
  def check_column?(column)
    current_piece = ""
    number_of_occurences = 0
    @board.board.each_with_index do |row, index|
      element = row[column]
      if element != "\u26b3" && current_piece.empty?
        current_piece = element
        number_of_occurences = 1
      elsif element != "\u26b3" && element == current_piece
        number_of_occurences += 1
        return [true, current_piece] if number_of_occurences == 4
      elsif element != "\u26b3" && element != current_piece
        return [false] if index > 2 # Don't continue to check the rest 
                                  # of the column if you're more than halfway 
                                  # through it and the color changes.
        current_piece = element
        number_of_occurences = 1
      else
        return [false] if index >= 2 # Don't continue to check the rest 
                                   # of the column if you're more than halfway 
                                   # through it and there are only empty spaces.
        current_piece = ""
      end
    end
  end

  def check_left_to_right?(row, column)
    board = @board.board
    current_piece = board[row][column]
    1.upto(3) { |increment| return [false] unless board[row+increment][column+increment] == current_piece }
    return [true, current_piece]
  end

  def check_right_to_left?(row, column)
    board = @board.board
    current_piece = board[row][column]
    1.upto(3) { |increment| return [false] unless board[row+increment][column-increment] == current_piece }
    return [true, current_piece]
  end
end