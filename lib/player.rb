# This class acts as a super class to
# the Human and Computer classes and contains
# memory and behavior corresponding to the 
# player's choice of color and ability to
# choose where they drop their piece on the 
# board.
class Player

  attr_reader :color

  def initialize(color)
    @color = color
  end

  # This method will be overwritten by the 
  # Human and Computer classes and will return 
  # a value corresponding to the column that the
  # piece will be dropped in.
  def choose(free = [0, 1, 2, 3, 4, 5, 6])

  end
end