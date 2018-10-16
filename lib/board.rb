require './lib/cell'
require './lib/player'
require 'pry'

class Board

  attr_reader :row_num, :row_a, :row_b, :row_c, :row_d

  def initialize

  @cells = [ [["O"],["1"],["2"],["3"],["4"]],
            [["A"], Cell.new('A', '1').display, Cell.new('A', '2').display, Cell.new('A', '3').display, Cell.new('A', '4').display],
            [["B"], Cell.new('B', '1').display, Cell.new('B', '2').display, Cell.new('B', '3').display, Cell.new('B', '4').display],
            [["C"], Cell.new('C', '1').display, Cell.new('C', '2').display, Cell.new('C', '3').display, Cell.new('C', '4').display],
            [["D"], Cell.new('D', '1').display, Cell.new('D', '2').display, Cell.new('D', '3').display, Cell.new('D', '4').display]]
  end

  def display
    p @cells[0]
    p @cells[1]
    p @cells[2]
    p @cells[3]
    p @cells[4]
  end

  def populate_board # used to affect those methods
    valid_spots = %w[A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4] # isolate
    # valid_spots -= %w[A1 A2 A3] # remove - every single space is a single cell
    empty_spots = {}
    valid_spots.map do |spot|
      spot = Cell.new(spot.chars[0], spot.chars[1]) # iso
      empty_spots[spot.x.to_s + spot.y.to_s] = spot
    end
    # placed_spots = {}
    # %w[A1 A2 A3].map do |spot|
    #   spot = Cell.new(spot.chars[0], spot.chars[1])
    #   spot.place_ship
    #   placed_spots[spot.x.to_s + spot.y.to_s] = spot
    # end

    # all_spots = empty_spots.merge(placed_spots) # Isolate
    empty_spots
  end
end
