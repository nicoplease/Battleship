class Ship
  attr_reader :length
  def initialize(length)
    @length = length
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
