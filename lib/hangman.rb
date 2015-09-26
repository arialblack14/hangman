filename = File.open("5desk.txt", "r")

def secret_code filename
	if filename.to_a.sample.length.between? 5, 12
		secret = secret_code filename
	end
end

puts secret_code filename