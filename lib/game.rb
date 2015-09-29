require 'yaml'
require_relative 'hangman'
require_relative 'player'

class Game
	attr_reader :ans, :game, :hangman

	def initialize
		@ans = 0
		@game = game
		@hangman = hangman
		# @secret = hangman.hidden_word
		# @word_given = hangman.hidden
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
			new_game

		elsif @ans == 2
			puts "Saving..."
			save_game
	
		elsif @ans == 3
			puts "Sorry to see you go..."
			exit

		else
			puts "1, 2 or 3 please."
			choice
		end
	end

	def new_game
		@hangman = Hangman.new
		@hangman.random_word
	end

	# Save and Load Game Methods

	def save_game
		save_now = YAML::dump(self)
		# Opening with open so no need to close and can pass a block
		save = File.open("saves.yml", "w") { |file| file.write(save_now) }
		
		3.times do
			sleep 1
			puts " . "
		end
	end

	def load_game game
		load_now = File.open("saves.yml", "r")
		load = YAML::load(load_now.read)
	end
end


game = Game.new
player = Player.new
player.hello
game.start

