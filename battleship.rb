require './lib/game'
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
    elsif input == 'q' || input =='quit'
      puts "OK,bye...!"
    else
      puts 'Invalid answer, please, try again'
      start
    end
  end

  def play
    game = Game.new
    game.display_board
    puts 'I have laid out my ships on the grid.'
    puts 'You now need to layout your two ships.'
    puts 'The first is two units long and the second is three units long.'
    puts 'The grid has A1 at the top left and D4 at the bottom right.'
    game.store_destroyer_spots
  end

end
Battleship.new
