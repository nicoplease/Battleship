require 'pry'
require './lib/board'
require './lib/player'
require './lib/ship'

class Game
attr_reader :board, :player1, :ship1, :ship2

  def initialize
    @board   = Board.new
    @player1 = Player.new
    @ship1   = Ship.new(2)
    @ship2   = Ship.new(3)
  end

  def display_board
    @board.display
  end

  def store_destroyer_spots
    input = gets.chomp
    ship_spots = []
    ship_spots << @ship1.record_coordinates(input.upcase)
    ship_spots.flatten
  end

  def store_submarine_spots
    input = gets.chomp
    # input = "B1 B3"
    sub_spots = []
    sub_spots << @ship2.record_coordinates(input.upcase)
    sub_spots.flatten
  end

end
