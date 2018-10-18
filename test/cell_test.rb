require './test/test_helper'

class CellTest < Minitest::Test

  def setup
  @cell = Cell.new('A', 1)
  @ship = Ship.new(2)
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_it_has_x_coord
    assert_equal 'A', @cell.x
  end

  def test_it_has_y_coord
    assert_equal 1, @cell.y
  end

  def test_it_has_default_status_arg
    assert_equal 0, @cell.status
  end

  def test_it_has_no_ship
    assert_nil @cell.ship?
  end

  def test_it_can_have_a_ship
    @cell.place_ship
    assert_equal true, @cell.ship?
  end

  def test_it_can_be_a_miss
    @cell.check
    assert_equal 1, @cell.status
    assert_equal 'M', @cell.display
  end

  def test_it_can_be_hit
    @cell.place_ship
    @cell.check

    assert_equal 2, @cell.status
    assert_equal 'H', @cell.display
  end

  def test_it_has_a_default_display
    assert_equal [' '], @cell.display
  end

  def test_it_starts_with_empty_array_of_ships_instances
    assert_equal [], @cell.ships
  end

  def test_it_can_have_a_ship_inside_of_cell
    @cell.ships << @ship
    assert_instance_of Ship, @cell.place_ship[0]
  end

  def test_cell_damages_ship_when_checked
    @cell.place_ship
    @cell.ships << ship
    @cell.check
    @cell.ships.first.damage

    assert_equal 1 , @cell.ships.first.health
  end

end
