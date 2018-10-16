require './lib/game'
require './lib/player'
require 'pry'

class Battleship

  def initialize
    start
  end

  def start
    puts "Welcome to BATTLESHIP"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print ">"
    input = gets.chomp
    if input == 'p' || input =='play'
      play
      elsif input == 'i' || input =='instructions'
        puts 'Ships cannot wrap around the board'
        puts 'Ships cannot overlap'
        puts 'Ships can be laid either horizontally or vertically'
        puts 'Coordinates must correspond to the first and last units of the ship.'
        puts  '(IE: You can’t place a two unit ship at “A1 A3”)'
      elsif input == 'q' || input =='quit'
        puts "OK,bye...!"
      else
        puts 'Invalid answer, please, try again'
        start
    end
  end

  def play
    Game.new
  end

end
Battleship.new
