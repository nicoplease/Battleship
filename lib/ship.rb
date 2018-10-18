require './lib/player'
require './lib/cell'

class Ship

  attr_reader :length, :coordinates

  def initialize(length)
    @length      = length
    @coordinates = []
  end

  def record_coordinates(coord)
    if length == 2
      player = Player.new.place_user_destroyer(coord)
    elsif length == 3
      player = Player.new.place_user_submarine(coord)
    end
    @coordinates << player
    @coordinates = @coordinates.flatten
  end

  def health
    @length
  end

  def damage
    @length -= 1
  end

  def status
    if @length >= 1
      'afloat'
    else
      'sunk'
    end
  end
end
