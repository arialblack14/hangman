file = File.open("5desk.txt", "r")
temp = file.to_a.sample

def random_word temp
	while !right_length temp
		temp = File.open("5desk.txt", "r").to_a.sample
	end
	temp
end

def right_length temp
	temp.length.between? 5, 12
end

puts random_word temp