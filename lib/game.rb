require 'pry'
require './lib/board'
require './lib/player'
require './lib/ship'
require './lib/cell'

class Game

attr_reader :cell,:board, :player1, :ship1, :ship2, :destroyer_spots

  def initialize
    @board   = Board.new
    @player1 = Player.new
    @ship1   = Ship.new(2)
    @ship2   = Ship.new(3)
    @destroyer_spots = []
  end

  def display_board
    @board.display
  end

  def store_destroyer_spots
    input = gets.chomp
    @destroyer_spots << @ship1.record_coordinates(input.upcase)
    @destroyer_spots = @destroyer_spots.flatten
  end

  def store_submarine_spots
    input = gets.chomp
    sub_spots = []
    sub_spots << @ship2.record_coordinates(input.upcase)
    sub_spots.flatten
  end

  def place_destroyer_in_cells
    @destroyer_spots.map do |spot|
      @board.cell_names[spot.to_sym].place_ship
      @board.cell_names[spot.to_sym].ships << @ship1
      @board.cell_names[spot.to_sym]
    end
  end

end
