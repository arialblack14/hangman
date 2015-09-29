require 'yaml'
require_relative 'hangman'
require_relative 'player'

class Game
	attr_reader :ans, :game, :hangman

	def initialize
		@ans = 0
		@game = game
		@hangman = hangman
	end

	def start
		puts "***H A N G M A N***"
		puts "Loading..."
		sleep 1
		puts "Please choose from 1 to 3."
		puts "1 : New game"
		puts "2 : Load saved game"
		puts "3 : Quit"
		@ans = gets.to_i
		choice
	end

	def choice
		if @ans == 1
			@hangman = Hangman.new
			@hangman.random_word
		elsif @ans == 2
			# some code to load game
		elsif @ans == 3
			puts "Sorry to see you go..."
			exit
		else
			puts "1, 2 or 3 please."
			choice
		end
	end
end


game = Game.new
player = Player.new
player.hello
game.start

# Save and Load Game Methods

def save_game
	save_me = YAML::dump(game)
	puts save_me
end

def load_game
	load_me = YAML::load(save_me)
end

