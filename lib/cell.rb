
class Cell

  attr_reader :x, :y, :status, :display,:ships

  def initialize(x, y, status = 0) # 0 is neutral, 1 is miss, 2 is hit
    @y       = y
    @x       = x
    @status  = status
    @ship    = nil
    @display = [' ']
    @ships   = []
  end

  def place_ship
    @ship = true # ship instance
    @ships
  end

  def ship?
    @ship
  end

  def check
    if @ship.nil?
       @status += 1
       @display = 'M'
    elsif @ship == true
       @status += 2
       @display = 'H'
    else
    end
  end
end
