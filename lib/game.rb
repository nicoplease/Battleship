require 'pry'
require "./lib/board"
require './lib/ship'


class Game
attr_reader :board, :player1, :ship1, :ship2, :destroyer_spots

  def initialize
    @board = Board.new
    @player1 = Player.new
    @ship1 = Ship.new(2)
    @ship2 = Ship.new(3)
    @ship_spots
    @destroyer_spots = []
  end

  def display_board
    @board.display
  end

  def store_destroyer_spots
    p "Place your 2 space Destroyer"
    print ">> "
    input = gets.chomp #- for implementation with battleship.rb
    # input = "A1 A2"
    @destroyer_spots << @ship1.record_coordinates(input.upcase)
    @destroyer_spots = @destroyer_spots.flatten
  end

  def store_submarine_spots
    p "Place your 3 space Submarine"
    print ">> "
    input = gets.chomp #- for implementation with battleship.rb
    # input = "B1 B3"
    sub_spots = []
    sub_spots << @ship2.record_coordinates(input.upcase)

    sub_spots.flatten
  end

  def place_destroyer_in_cells
    coordinates = {"A"=>1, "B"=>2, "C"=>3, "D"=>4, "1"=>1, "2"=>2, "3"=>3, "4"=>4}
    @destroyer_spots.map do |spot|
      @board.cell_names[spot.to_sym].place_ship
      @board.cell_names[spot.to_sym].ships << @ship1      
      @board.cell_names[spot.to_sym]
    end
  end

end

binding.pry
