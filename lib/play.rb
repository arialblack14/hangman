require 'yaml'
require_relative 'run/game'
require_relative 'run/hangman'
require_relative 'run/player'

game = Game.new
player = Player.new
player.hello
puts
game.start