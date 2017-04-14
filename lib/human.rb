require "player"

# This class inherits from the Player  
# class and focuses on its own implementation
# of the choose method.
class Human < Player

  # Returns a value between 0-6 corresponding 
  # to the column where the piece will be dropped.
  def choose(free = [0, 1, 2, 3, 4, 5, 6])
    column = 0
    until column.between?(1,7) && free.include?(column - 1)          # column - 1 allows the user to type 
                                                                     # without worrying about zero-indexed.
      puts "Choose any column between 1-7 as long as it is not full\n\n"
      column = gets.chomp.to_i
      puts ""
    end
    column - 1
  end
end