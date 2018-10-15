require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test
  def test_it_exists
    ship = Ship.new(2)

    assert_instance_of Ship, ship
  end

  def test_it_has_length
    ship = Ship.new(2)

    assert_equal 2, ship.length
  end

  def test_it_has_health
    ship = Ship.new(2)

    assert_equal 2, ship.health
  end

  def test_it_can_take_damage
    ship = Ship.new(2)

    assert_equal 1, ship.damage
  end

  def test_it_can_sink
    ship = Ship.new(2)
    ship.damage
    ship.damage

    assert_equal 'sunk', ship.status
  end

  def test_it_can_float
    ship = Ship.new(2)

    assert_equal 'afloat', ship.status
  end
end
