require 'pry'
require './lib/board'
require './lib/player'
require './lib/ship'

class Game

attr_reader :cell,:board, :player1, :ship1, :ship2, :destroyer_spots

  def initialize
    @board           = Board.new
    @player1         = Player.new
    @ship1           = Ship.new(2)
    @ship2           = Ship.new(3)
    @destroyer_spots = []
    @sub_spots       = []
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
    @sub_spots << @ship2.record_coordinates(input.upcase)
    @sub_spots = @sub_spots.flatten
  end

  def place_destroyer_in_cells
    @destroyer_spots.map do |spot|
      @board.cell_names[spot.to_sym].place_ship
      @board.cell_names[spot.to_sym].ships << @ship1
      @board.cell_names[spot.to_sym]
    end

  end

  def place_submarine_in_cells
    @sub_spots.map do |spot|
      @board.cell_names[spot.to_sym].place_ship
      @board.cell_names[spot.to_sym].ships << @ship2
      @board.cell_names[spot.to_sym]
    end
  end

  def guess(input)
    input_s = input.to_sym
    @board.cell_names[input_s].check
    if @board.cell_names[input_s].check == ['H']
      @board.cell_names[input_s].check
      @board.cell_names[input_s].ships[0].damage
    elsif @board.cell_names[input_s].check == ['M']
      @board.display
      @board.cell_names[input_s].check
      puts "And your next one?"
      print ">> "
      input = gets.chomp
      guess(input.upcase)
    end
    @board.display
  end

end
