require 'minitest/autorun'
require 'minitest/pride'
require './lib/player.rb'

class PlayerClass < Minitest::Test

  def test_it_exists
    player = Player.new

    assert_instance_of Player, player
  end

  def test_it_can_place_a_destroyer
    player = Player.new

    assert_equal %w[A1 A2], player.place_user_destroyer('A1 A2')
  end
  #
  # def test_it_can_place_ships
  #   player = Player.new
  #
  #   assert_equal %w[A1 C1 B1], player.place_user_submarine('A1 C1')
  # end
end
