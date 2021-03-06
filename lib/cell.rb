require './lib/ship'
require 'pry'

class Cell
  
  attr_accessor :display
  attr_reader :x, :y, :status, :display, :ships, :place_ship

  def initialize(x, y, status = 0)

    @y       = y
    @x       = x
    @status  = status
    @ship    = nil
    @display = [' ']
    @ships   = []
  end

  def place_ship
    @ship = true

    @ships
  end

  def ship?
    @ship
  end

  def check
    if @ship.nil?
       @status += 1
       @display = ['M']
    elsif @ship == true
       @status += 2
       @display = ['H']
    end
  end
end
