# import the input as an array of numbers
# iterate through, and increment a counter if the current is larger than the last
# return the count

def count_depth_increase(input)
	count = 0
	puts "Size of Array: #{input.size}"
	for i in 1...input.size do
		#puts "Current: #{input[i]}, Previous: #{input[i-1]}"
		count += 1 if input[i].to_i > input[i-1].to_i
	end
	return count
end

# map the input into a new array of 3-measurement windows
# pass that array to count_depth_increase

def sliding_measurement_windows(input)
	windows = input.map.with_index { |number, idx| [number.to_i, input[idx + 1].to_i, input[idx + 2] ].sum }
	puts "Windows Increased: #{count_depth_increase(windows)}"
end

# puts Dir.pwd
# Changes the current working directory to the same as the ruby file that is running, allowing simple reference to text file
Dir.chdir(File.dirname(__FILE__))
# Reads the input.txt file and splits by line into an array
#input = File.read("input.txt", mode: "rb").split
input = File.read("input.txt").split

puts count_depth_increase(input)
sliding_measurement_windows(input)