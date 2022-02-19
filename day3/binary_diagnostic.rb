# puts Dir.pwd
# Changes the current working directory to the same as the ruby file that is running, allowing simple reference to text file
Dir.chdir(File.dirname(__FILE__))
# Reads the input.txt file and splits by line into an array
#input = File.read("input.txt", mode: "rb").split
input = File.read("input.txt").split

# split each line into an array of digits
# sum all digits in a particular 'column'? then compare it to half the number of total arrays which will show whther 1 is the more common digit
# the other digit is the less common one
# convert things to binary and decimal when needed

def power_consumption(input)
	puts "Number of inputs: #{input.size}"
	gamma_rate_array = [[],[],[],[],[],[],[],[],[],[],[],[]]

	input.each do |line|
		digit_array = line.split('')
		for i in 0...digit_array.size
			gamma_rate_array[i].push(digit_array[i].to_i)
		end
	end
	gamma_rate_as_binary = gamma_rate_array.map { |position| position.sum > (input.size)/2 ? 1 : 0 }.join(&:+)
	epsilon_rate_as_binary = gamma_rate_array.map { |position| position.sum < (input.size)/2 ? 1 : 0 }.join(&:+)
	puts "Gamma: #{gamma_rate_as_binary.to_i(2)} Epsilon: #{epsilon_rate_as_binary.to_i(2)}"
	puts "Power Consumption: #{gamma_rate_as_binary.to_i(2) * epsilon_rate_as_binary.to_i(2)}"
	return gamma_rate_as_binary.to_i(2), epsilon_rate_as_binary.to_i(2)
end

#def power_consumption(gamma_rate, epsilon_rate)
#	puts "Power Consumption: #{gamma_rate * epsilon_rate}"
#end

def oxygen_generator_rating(input)
	digit_width = input[0].length
	holding_input = input.map { |line| line.split('') }
	for i in 0...digit_width
		count = 0
		holding_input.each do |line|
			digit_array = line.map { |digit| digit.to_i }
			print "#{digit_array}\n"
			count += digit_array[i]
			puts count
		end
		puts "#{count} of #{holding_input.size}"
		most_common = count >= (holding_input.size.to_f)/2 ? 1 : 0 # 1 or 0, defaults to 1
		puts "#{most_common} is most common at position #{i}"
		holding_input = holding_input.select { |line| line[i].to_i == most_common }
		puts "Input remaining: #{holding_input.size}"
		break if holding_input.size == 1
	end
	return holding_input[0].join(&:+)
end

def co2_scrubber_rating(input)
	digit_width = input[0].length
	holding_input = input.map { |line| line.split('') }
	for i in 0...digit_width
		count = 0
		holding_input.each do |line|
			digit_array = line.map { |digit| digit.to_i }
			print "#{digit_array}\n"
			count += digit_array[i]
			#puts count
		end
		puts "#{count} of #{holding_input.size}"
		least_common = count >= (holding_input.size.to_f)/2 ? 0 : 1 # 1 or 0, defaults to 1
		puts "#{least_common} is least_common at position #{i}"
		holding_input = holding_input.select { |line| line[i].to_i == least_common }
		puts "Input remaining: #{holding_input.size}"
		return holding_input[0].join(&:+) if holding_input.size == 1
	end
	return holding_input[0].join(&:+)
end

def life_support_rating(input)
	return oxygen_generator_rating(input).to_i(2) * co2_scrubber_rating(input).to_i(2)
end

# power_consumption(input)

#input = [
#	"00100",
#	"11110",
#	"10110",
#	"10111",
#	"10101",
#	"01111",
#	"00111",
#	"11100",
#	"10000",
#	"11001",
#	"00010",
#	"01010"
#]

puts "O2 rating - Binary: #{oxygen_generator_rating(input)} Decimal: #{oxygen_generator_rating(input).to_i(2)}"
puts "CO2 rating - Binary: #{co2_scrubber_rating(input)} Decimal: #{co2_scrubber_rating(input).to_i(2)}"
puts "Life Support Rating: #{life_support_rating(input)}"