require './lib/cell'
require 'pry'

class Player

  attr_reader :ship_spots, :placed

  def initialize
    @ship_spots = nil
    @placed     = []
    @empty_spot = nil
  end

  def place_user_destroyer(place) # "A1 A2" # make sure string passed into it is upcase
    if place.chars[0].next == place.chars[3] && place.chars[1] == place.chars[4]
      place = place.split # if place is "A1 A2" returns an array of coordinates
    elsif place.chars[0] == place.chars[3] && place.chars[1].to_i + 1 == place.chars[4].to_i
      place = place.split # if place is "A1 B1" returns an array of coordinates
    else
      return nil
    end

    # binding.pry

    place.each do |place|
      valid_spots = %w[A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4]

      next unless valid_spots.include?(place)

      @placed << place
      @empty_spot = valid_spots - @placed

      # empty_spots = {}
      # empty_spot.map do |test|
      #   test = Cell.new(test.chars[0], test.chars[1])
      #   empty_spots[test.x.to_s + test.y.to_s] = test
      # end

      # @ship_spots = {}
      # @placed.map do |test|
      #   test = Cell.new(test.chars[0], test.chars[1])
      #   test.place_ship
      #   @ship_spots[test.x.to_s + test.y.to_s] = test
      # end
      # @valid_guesses = empty_spots.merge(@ship_spots)
      @placed
    end
  end

  def place_user_submarine(place) # "A1 A3" make sure string passed into it is upcase
    if place.chars[0] == place.chars[3] && place.chars[1].to_i + 2 == place.chars[4].to_i
      place = place.split << (place[0] + (place.chars[1].to_i + 1).to_s) # if place is "A1 A3" add "A2" into the array representing a ship
    elsif place.chars[0].next.next == place.chars[3] && place.chars[1] == place.chars[4]
      place = place.split << place.chars[0].next + place.chars[1] # if place is "A1 C1" adds B1
    else
      return nil
    end

    place.each do |place| # place = ["A1", "A2"]
      valid_spots = %w[A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4]

      next unless valid_spots.include?(place)

      @placed << place
      @empty_spot = valid_spots - @placed

      # empty_spots = {}
      # empty_spot.map do |test|
      #   test = Cell.new(test.chars[0], test.chars[1])
      #   empty_spots[test.x.to_s + test.y.to_s] = test
      # end

      # ship_spots = {}
      # @placed.map do |test|
      #   test = Cell.new(test.chars[0], test.chars[1])
      #   test.place_ship
      #   ship_spots[test.x.to_s + test.y.to_s] = test
      # end

      # break if @valid_guesses.nil? # if coordinates dont work - break
      # @full_board = @full_board.merge(@valid_guesses)

      @placed[-3..-1]
    end
  end
end
