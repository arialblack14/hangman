class Game
	attr_reader :game, :file, :word

	def initialize
		@game = game
		@file = File.open("5desk.txt", "r")
		@word = @file.to_a.sample.chomp
		@ans = 0
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
			random_word
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
	
	def random_word
		while !right_length @word
			temp = File.open("5desk.txt", "r").to_a.sample.chomp
			@word = temp
		end
		@word
	end

	def right_length word
		@word.length.between? 5, 12
	end
end

class Player
	attr_reader :name

	def initialize name = "Stranger"
		@name = name
	end

	def hello
		puts "Hello #{@name}."
	end
end

game = Game.new
player = Player.new
player.hello
p game.start
