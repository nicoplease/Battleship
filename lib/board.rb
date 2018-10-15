require './lib/cell'
require './lib/player'
require 'pry'
class Board
  attr_reader :row_num, :row_a, :row_b, :row_c, :row_d, :populate_board, :valid_guesses, :empty_spots
  def initialize
    @guessed = []
    @row_num = { 1 => ['0'], 2 => ['1'], 3 => ['2'], 4 => ['3'], 5 => ['4'] }
    @row_a = { 1 => ['A'], 2 => [populate_board['A1'].display], 3 => [populate_board['A2'].display], 4 => [populate_board['A3'].display], 5 => [populate_board['A4'].display] }
    @row_b = { 1 => ['B'], 2 => [populate_board['B1'].display], 3 => [populate_board['B2'].display], 4 => [populate_board['B3'].display], 5 => [populate_board['B4'].display] }
    @row_c = { 1 => ['C'], 2 => [populate_board['C1'].display], 3 => [populate_board['C2'].display], 4 => [populate_board['C3'].display], 5 => [populate_board['C4'].display] }
    @row_d = { 1 => ['D'], 2 => [populate_board['D1'].display], 3 => [populate_board['D2'].display], 4 => [populate_board['D3'].display], 5 => [populate_board['D4'].display] }
  end

  def display
    p row_num.values
    p row_a.values
    p row_b.values
    p row_c.values
    p row_d.values
  end

  # def active_board
  #   @empty_spots.each do |test|
  #   if test.include?("A1")
  #
  # end

  def populate_board # used to affect those methods
    valid_spots = %w[A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4] # isolate
    valid_spots -= %w[A1 A2 A3] # @placed   # @placed but without player
    @empty_spots = {}
    valid_spots.map do |test|
      test = Cell.new(test.chars[0], test.chars[1]) # iso
      @empty_spots[test.x.to_s + test.y.to_s] = test
    end
    @placed_spots = {}
    %w[A1 A2 A3].map do |test|
      test = Cell.new(test.chars[0], test.chars[1])
      test.place_ship
      @placed_spots[test.x.to_s + test.y.to_s] = test
    end

    @all_spots = @empty_spots.merge(@placed_spots) # Isolate
  end
end
player = Player.new
board = Board.new
board.display
player.place_user_destroyer('A1 A2')
player.place_user_submarine('B1 B3')
p board.populate_board['A1']
# p board.empty_spots
# p board.populate_board['A1']
