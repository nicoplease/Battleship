require 'pry'
require "./lib/board"

class Game
attr_reader :board, :player1

  def initialize
    @board = Board.new
    @player1 = Player.new
  end

end
