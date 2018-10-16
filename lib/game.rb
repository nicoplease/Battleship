require 'pry'
require "./lib/board"
require './lib/ship'


class Game
attr_reader :board, :player1, :ship1, :ship2

  def initialize
    @board = Board.new
    @player1 = Player.new
    @ship1 = Ship.new(2)
    @ship2 = Ship.new(3)
  end

  def display_board
    @board.display
  end

  def store_ship_spots
    p "Place your 2 space Destroyer"
    print ">> "
    # input = gets.chomp - for implementation with battleship.rb
    input = "A1 A2"
    ship_spots = []
    ship_spots << @ship1.record_coordinates(input)
    ship_spots.flatten

    p "Place your 3 space Submarine"
    print ">> "
    # input = gets.chomp - for implementation with battleship.rb
    input = "B1 B3"
    ship_spots << @ship2.record_coordinates(input)

    ship_spots.flatten
  end

# binding.pry







end
