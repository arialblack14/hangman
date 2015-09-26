filename = File.open("5desk.txt", "r")

filename.each do |row|
	puts row
end