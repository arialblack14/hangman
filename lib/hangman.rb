class Game
	attr_reader :ans, :game

	def initialize
		@ans = 0
		@game = game
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
			hangman = Hangman.new
			hangman.random_word
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

class Player
	attr_reader :name

	def initialize name = "Stranger"
		@name = name
	end

	def hello
		puts "Hello #{@name}."
	end
end

class Hangman
	attr_reader :file, :word, :letter, :hidden, :turn, :not_found

	def initialize
		@file = File.open("5desk.txt", "r")
		@word = @file.to_a.sample.chomp
		@letter = letter
		@hidden = []
		@turn = 14
		@not_found = []
	end
	
	def random_word
		while !right_length @word
			temp = File.open("5desk.txt", "r").to_a.sample.chomp
			@word = temp
		end
		@word
		hidden_word
		find_word
	end

	def right_length word
		@word.length.between? 5, 12
	end

	def hidden_word
		# Loop the length of the secret word times
		@word.length.times do
			@hidden << "_ "
		end
		p @hidden.join(" ")
	end

	def find_word
		puts "Give me a letter: "
		@letter = gets.downcase.chomp[0]
		guess @letter
	end

	def guess letter
		if !('a'..'z').to_a.include? @letter
			puts "A valid letter please."
			find_word
		end
		i = 0
		if @word.include? @letter
			puts "Found '#{@letter}'"
			i = @word.index(@letter)
			# Player can not give same letter twice
			unless @hidden.include? @letter
				@hidden[i] = @letter
			else
				find_word
			end
		else 
			puts "'#{@letter}'' not found."
			@not_found << @letter
			@turn -= 1
		end
		p @hidden.join(" ")
		letters_not_found		
		puts "You have #{@turn} tries left."
		find_word unless no_turns_left
	end

	def letters_not_found
		puts "Letters not found: "+ @not_found.join(" ")
	end

	def no_turns_left
		if @turn == 0
			puts "You lose...Sorry"
			puts "Secret word was '#{@word}'."
			exit
		end
	end
end

game = Game.new
player = Player.new

player.hello
game.start
