require './lib/cell'
require 'pry'

class Player

  attr_reader :placed

  def initialize
    @placed = []
  end

  def place
    valid_spots = %w[A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4]
    place.each do |place|
      if valid_spots.include?(place)
        @placed << place
        valid_spots -= @placed
        @placed
      end
    end
  end


  def place_user_destroyer(place)
    if place.chars[0].next == place.chars[3] && place.chars[1] == place.chars[4]
      place = place.split
    elsif place.chars[0] == place.chars[3] && place.chars[1].to_i + 1 == place.chars[4].to_i
      place = place.split
    else
      return nil
    end
    @placed << place
    place
  end

  def place_user_submarine(place)
    if place.chars[0] == place.chars[3] && place.chars[1].to_i + 2 == place.chars[4].to_i
      place = place.split << (place[0] + (place.chars[1].to_i + 1).to_s)
    elsif place.chars[0].next.next == place.chars[3] && place.chars[1] == place.chars[4]
      place = place.split << place.chars[0].next + place.chars[1]
    else
      return nil
    end
    @placed << place
    @placed[-1]
  end
end
