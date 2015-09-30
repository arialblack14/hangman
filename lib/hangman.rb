class Hangman
	attr_accessor :turn
	attr_reader :game, :file, :word, :letter, :hidden, :not_found

	def initialize
		@file = File.open("5desk.txt", "r")
		@word ||= @file.to_a.sample.downcase.chomp
		@letter = letter
		@hidden ||= []
		@turn = 10
		@not_found ||= []
		@game = Game.new
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

	# Make an array of _ _ _ for the hidden word
	def hidden_word
		# Loop the length of the secret word times
		@word.length.times do
			@hidden << "_ "
		end
		p @hidden.join(" ")
	end

	def find_word
		puts "Give me a letter: "
		puts "You can save your progress by typing: '2'"
		@letter = gets.downcase.chomp[0] 
		guess @letter
	end

	def guess letter
		# Checks if letter given is valid
		unless @letter == "2"
			if !('a'..'z').to_a.include? @letter
				puts "A valid letter please."
				find_word
			end
		else
			@game.save_game
			puts "Saved! Bye..."
			exit
		end
		
		if @word.include? @letter
			puts "Found '#{@letter}'"
			# Substitute all occurences of given letter in @hidden array
			word_arr = @word.split("").each_index.select { |w| @word[w] == @letter }
			word_arr.each do |i|
				@hidden[i] = @letter
			end
			if @word.to_s == @hidden.join("").to_s
				puts "You win!!"
				puts "Secret word was #{@word}."
				puts "Bye..."
				exit
			end
		else 
			puts "'#{@letter}' not found."
			@not_found << @letter
			@turn -= 1
		end
		p @hidden.join(" ")
		letters_not_found		
		puts "You have #{@turn} tries left."
		find_word unless no_turns_left
	end

	# Makes the array of not found letters
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