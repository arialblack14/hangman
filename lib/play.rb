require 'yaml'
require_relative 'run/game'
require_relative 'run/hangman'
require_relative 'run/player'

game = Game.new
player = Player.new
puts "***************"
player.hello
puts
game.start