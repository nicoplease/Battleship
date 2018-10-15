require 'pry'
require "./lib/board"

class Game
attr_reader :board

  def initialize
    @board = Board.new
  end

end
