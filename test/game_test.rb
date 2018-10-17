require './test/test_helper'

class GameTest < Minitest::Test

  def setup
  @game = Game.new
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_it_can_have_a_board
    assert_instance_of Board, @game.board
  end

  def test_it_can_have_player
    assert_instance_of Player, @game.player1
  end

  def test_it_can_display_board
    assert_equal [["D"], [" "], [" "], [" "], [" "]], @game.board.display
  end

  def test_ships_can_have_coordinates
    # ship1 = Ship.new(2)
    # ship2 = Ship.new(3)
    assert_equal %W[A1 A2], @game.ship1.record_coordinates("A1 A2")
    assert_equal %w[B1 B3 B2], @game.ship2.record_coordinates("B1 B3") #overlap later !!
  end

  def test_gameboard_can_store_ship_coordinates
    # ship1 = Ship.new(2)
    # ship2 = Ship.new(3)
    assert_equal %w[A1 A2], @game.store_destroyer_spots
  end

  def test_gameboard_can_store_ship_coordinates
    # ship2 = Ship.new(3)
    assert_equal %w[B1 B3 B2], @game.store_submarine_spots
  end


end
