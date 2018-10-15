require './lib/player'

class Ship
  attr_reader :length, :coordinates
  def initialize(length) # instead of length (cell(A1), cell(A2))
    @length = length
    @coordinates = []
  end

  def record_coordinates(coord)
    player = Player.new.place_user_destroyer(coord)

    @coordinates << player
    @coordinates.flatten
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
