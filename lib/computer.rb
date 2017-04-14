require "player"

# This class inherits from the Player  
# class and focuses on its own implementation
# of the choose method.
class Computer < Player

  # Returns a random value between 0-6 
  # corresponding to a free column where 
  # the piece will be dropped.
  def choose(free = [0, 1, 2, 3, 4, 5, 6])
    column = free.sample
  end
end