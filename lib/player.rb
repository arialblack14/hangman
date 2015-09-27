class Player
	attr_reader :name

	def initialize name = "Stranger"
		@name = name
	end

	def hello
		puts "Hello #{@name}."
	end
end