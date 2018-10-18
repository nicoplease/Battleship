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
    print ">> "
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
    puts "Place your 2-space ship on the board. (ex: A1 A2)"
    print ">> "
    game.store_destroyer_spots
    game.place_destroyer_in_cells
    puts "Place your 3-space ship on the board. (ex: B1 B3)"
    print ">> "
    game.store_submarine_spots
    game.place_submarine_in_cells
    game.display_board
    puts "Alright, now what's your first guess?"
    print ">> "
    input = gets.chomp
    game.guess(input.upcase)
    until game.ship1.health < 1 && game.ship2.health < 1
      game.display_board
      puts "And your next one? "
      input = gets.chomp
      game.guess(input.upcase)
    end
    puts "congratulations! you won."
  end
end
Battleship.new
