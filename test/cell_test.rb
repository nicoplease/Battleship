require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'

class CellTest < Minitest::Test

  def test_it_exists
    cell = Cell.new('A', 4)

    assert_instance_of Cell, cell
  end

  def test_it_has_x_coord
    cell = Cell.new('A', 1)

    assert_equal 'A', cell.x
  end

  def test_it_has_y_coord
    cell = Cell.new('A', 1)

    assert_equal 1, cell.y
  end

  def test_it_has_default_status_arg
    cell = Cell.new('A', 1)

    assert_equal 0, cell.status
  end

  def test_it_has_no_ship
    cell = Cell.new('A', 1)

    assert_equal nil, cell.ship?
  end

  def test_it_can_have_a_ship
    cell = Cell.new('A', 1)
    cell.place_ship

    assert_equal true, cell.ship?
  end

  def test_it_can_be_a_miss
    cell = Cell.new('A', 1)
    cell.check

    assert_equal 1, cell.status
    assert_equal 'M', cell.display
  end

  def test_it_can_be_hit
    cell = Cell.new('A', 1)
    cell.place_ship
    cell.check

    assert_equal 2, cell.status
    assert_equal 'H', cell.display
  end

  def test_it_has_a_default_display
    cell = Cell.new('A', 1)

    assert_equal ' ', cell.display
  end
end
