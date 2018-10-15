require './lib/cell'
require 'pry'

class Player

  attr_reader :ship_spots, :placed

  def initialize
    @placed = []
    @ship_spots = nil
    @empty_spot = nil
  end

  def place
    place.each do |place| # helper method
      valid_spots = %w[A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4]

      if valid_spots.include?(place)
        @placed << place
        @empty_spot = valid_spots - @placed

        @placed
      end
    end
  end


  def place_user_destroyer(place) # "A1 A2" # make sure string passed into it is upcase
    if place.chars[0].next == place.chars[3] && place.chars[1] == place.chars[4]
      place = place.split # if place is "A1 A2" returns an array of coordinates
    elsif place.chars[0] == place.chars[3] && place.chars[1].to_i + 1 == place.chars[4].to_i
      place = place.split # if place is "A1 B1" returns an array of coordinates
    else
      return nil
    end

    @placed << place
    place
  end

  def place_user_submarine(place) # "A1 A3" make sure string passed into it is upcase
    if place.chars[0] == place.chars[3] && place.chars[1].to_i + 2 == place.chars[4].to_i
      place = place.split << (place[0] + (place.chars[1].to_i + 1).to_s) # if place is "A1 A3" add "A2" into the array representing a ship
    elsif place.chars[0].next.next == place.chars[3] && place.chars[1] == place.chars[4]
      place = place.split << place.chars[0].next + place.chars[1] # if place is "A1 C1" adds B1
    else
      return nil
    end

    @placed << place
    @placed[-1]
  end
end

# player = Player.new
# p player.place_user_destroyer('A1 A2')
# p player.place_user_submarine('A1 C1')
# p player.placed
