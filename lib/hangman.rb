class Game
	attr_reader :game, :file, :word

	def initialize
		@game = game
		@file = File.open("5desk.txt", "r")
		@word = @file.to_a.sample.chomp
	end
	
	def random_word
		while !right_length @word
			temp = File.open("5desk.txt", "r").to_a.sample.chom
			@word = temp
		end
		@word
	end

	def right_length word
		@word.length.between? 5, 12
	end
end

game = Game.new
p game.file
p game.random_word
