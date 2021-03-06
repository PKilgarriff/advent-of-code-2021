# Changes the current working directory to the same as the ruby file that is running, allowing simple reference to text file
Dir.chdir(File.dirname(__FILE__))
# Reads the input.txt file and splits by line into an array
# input = File.read_lines("input.txt").split
# needs to be different here as we are generating a set of keys and values
# take each line and split it on whitespace, the first part is the key, the second is the value which needs to be cast to an integer
input = File.foreach("input.txt").map { |line| [line.split[0], line.split[1].to_i] }
#print input

# join all the forwards, ups and downs (is there a backward?)
# subtract the total ups from the downs
# multiply the depth and the horizontal position

def basic_calculate_position(input)
	#print input
	puts split_lines = input.group_by { |key, value| key }

	puts forward_movements = (split_lines["forward"].map { |n| n[1] }).sum
	puts up_movements = (split_lines["up"].map { |n| n[1] }).sum
	puts down_movements = (split_lines["down"].map { |n| n[1] }).sum

	horizontal = forward_movements
	depth = down_movements - up_movements

	return horizontal * depth
end

def advanced_calculate_position(input)
	horizontal = 0
	depth = 0
	aim = 0

	#print input
	#print "\n"
	input.each do |line|
		#print "#{line}\n"
		if line[0] == "forward"
			horizontal += line[1]
			depth += line[1] * aim
		end
		aim += line[1] if line[0] == "down"
		aim -= line[1] if line[0] == "up"
	end

	return horizontal * depth
end

#puts basic_calculate_position(input)
puts advanced_calculate_position(input)