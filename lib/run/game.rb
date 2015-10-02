class Game
	attr_reader :ans, :turn, :word, :hidden,
							:game, :letter

	def initialize
		@ans = 0
		@game = game
		@turn = @turn
		@word = @word
		@hidden = @hidden
		@letter = @letter
	end

	def start
		puts "*******************"
		puts "***H A N G M A N***"
		puts "*******************"
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
			puts "Loading..."
			load_game
	
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
		file_save = File.open("saves.yml", "w") { |file| file.write(save_now) }
		
		3.times do
			sleep 1			
			puts ". "
		end
	end

	def load_game
		load_now = File.open("saves.yml", "r") # 'r' is optional
		YAML::load(load_now.read)
		Hangman.new.random_word
		load_now.close
	end
end
