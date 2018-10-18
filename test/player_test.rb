require './test/test_helper'

class PlayerClass < Minitest::Test

  def setup
  @player = Player.new
  end

  def test_it_exists
    assert_instance_of Player, @player
  end

  def test_it_can_place_a_destroyer
    assert_equal %w[A1 A2], @player.place_user_destroyer('A1 A2')
  end

  def test_it_can_place_ships
    assert_equal %w[A1 C1 B1], @player.place_user_submarine('A1 C1')
  end
end
