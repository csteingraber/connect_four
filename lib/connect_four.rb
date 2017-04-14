$LOAD_PATH.unshift File.expand_path("../", __FILE__)
require "game"

connect_four = Game.new
connect_four.start