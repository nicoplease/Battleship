require './test/test_helper'

class BoardTest < Minitest::Test

  def setup
  @board = Board.new
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_it_can_be_displayed
  expected = [ [["O"],["1"],["2"],["3"],["4"]],
              [["A"], Cell.new('A', '1').display, Cell.new('A', '2').display, Cell.new('A', '3').display, Cell.new('A', '4').display],
              [["B"], Cell.new('B', '1').display, Cell.new('B', '2').display, Cell.new('B', '3').display, Cell.new('B', '4').display],
              [["C"], Cell.new('C', '1').display, Cell.new('C', '2').display, Cell.new('C', '3').display, Cell.new('C', '4').display],
              [["D"], Cell.new('D', '1').display, Cell.new('D', '2').display, Cell.new('D', '3').display, Cell.new('D', '4').display]]
   assert_equal expected, @board.cells
  end

  def test_it_can_be_populated_by_cells
    assert_equal [' '], @board.populate_board['A1'].display
  end

  def test_it_can_have_a_status
    assert_equal 0, @board.populate_board['A1'].status
  end

end
