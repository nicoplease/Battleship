require './test/test_helper'

class ShipTest < Minitest::Test

  def setup
  @ship = Ship.new(2)
  @ship_2 = Ship.new(3)
  end

  def test_it_exists
    assert_instance_of Ship, @ship
  end

  def test_it_has_length
    assert_equal 2, @ship.length
  end

  def test_it_has_health
    assert_equal 2, @ship.health
  end

  def test_it_can_take_damage
    assert_equal 1, @ship.damage
  end

  def test_it_can_sink
    @ship.damage
    @ship.damage
    assert_equal 'sunk', @ship.status
  end

  def test_it_can_float
    assert_equal 'afloat', @ship.status
  end

  def test_it_starts_with_empty_coordinates
    assert_equal [], @ship.coordinates
  end

  def test_it_can_record_coordinates
    assert_equal %w[A1 A2], @ship.record_coordinates("A1 A2")
  end

  def test_you_can_change_coordinates
    assert_equal %w[A1 A2], @ship.record_coordinates('A1 A2')
  end

  def test_it_coordinates_can_exist_for_submarine
    assert_equal %w[A1 A3 A2], @ship_2.record_coordinates('A1 A3')
  end

  def test_it_coordinates_can_exist_for_destroyer
    assert_equal %w[A1 A2], @ship.record_coordinates('A1 A2')
  end

  def test_ships_can_have_cells
    @ship.record_coordinates("A1 A2")
    assert_equal "A1", @ship.cell.keys[0]
  end

end
