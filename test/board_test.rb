require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'

class BoardTest < Minitest::Test
  def test_it_exists
    board = Board.new

    assert_instance_of Board, board
  end

  def test_it_loads_on_initialization
    board = Board.new

    assert_equal ({ 1 => ['0'], 2 => ['1'], 3 => ['2'], 4 => ['3'], 5 => ['4'] }), board.row_num
  end

  def test_it_can_be_displayed
    board = Board.new

    assert_equal ['A'], board.row_a[1]
    assert_equal ['B'], board.row_b[1]
    assert_equal ['C'], board.row_c[1]
    assert_equal ['D'], board.row_d[1]
  end

  def test_it_can_be_populated_by_cells
    board = Board.new

    assert_equal ' ', board.populate_board['A1'].display
    assert_equal 0, board.populate_board['A1'].status
  end

  def test_its_cells_can_have_ships
    board = Board.new

    assert_equal true, board.populate_board['A1'].ship?
  end
end
