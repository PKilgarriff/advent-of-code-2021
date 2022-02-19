class VentMapper
	attr_reader :vent_map, :vent_line_coordinates

	def initialize(input)
		@starts_and_ends = input
		vent_line_plotter
	end

	def create_empty_grid(x, y)
		@vent_map = []
		#empty_row = Array.new((x+1), 0)
		(y+1).times { @vent_map.push(Array.new((x+1), 0)) }
	end

	def vent_line_plotter
		max_x = 0
		max_y = 0
		@vent_line_coordinates = []
		@starts_and_ends.each do |line|
			coordinates = line.split(" -> ")
			vent_start_x, vent_start_y = coordinates[0].split(',').map(&:to_i)
			vent_end_x, vent_end_y = coordinates[1].split(',').map(&:to_i)
			# puts "Vent Start x:#{vent_start_x} y:#{vent_start_y}"
			# puts "Vent End x:#{vent_end_x} y:#{vent_end_y}"

			if vent_start_x == vent_end_x
				line_type = "vertical"
			elsif vent_start_y == vent_end_y
				line_type = "horizontal"
			else
				line_type = "diagonal"
				next
			end

			if line_type == "vertical"
				temp_array = []
				start_point = [vent_start_y, vent_end_y].min
				end_point = [vent_start_y, vent_end_y].max
				for i in start_point..end_point
					temp_array.push([vent_end_x, i])
				end
				@vent_line_coordinates.push(temp_array)
			end
			if line_type == "horizontal"
				temp_array = []
				start_point = [vent_start_x, vent_end_x].min
				end_point = [vent_start_x, vent_end_x].max
				for i in start_point..end_point
					temp_array.push([i, vent_end_y])
				end
				@vent_line_coordinates.push(temp_array)
			end
			# check to see if either of the vent co-ordinates are greater than our current measurements (Needed to calculate final grid size)
			max_x = [max_x, [vent_start_x, vent_end_x].max].max
			max_y = [max_y, [vent_start_y, vent_end_y].max].max
		end
		# puts "Max X: #{max_x}, Max Y: #{max_y}"
		create_empty_grid(max_x, max_y)
		# print @starts_and_ends
	end

	# I think I need to make an array of arrays representing co-ordinates for each point on a line
	# I can then go through that array, adding 1 to the value within the vent_map at each position
	# this way I don't have to worry about whether the start or end is higher/lower, left/right
	# plus no need to iterate trhough the entire empty map 'several' times

	def grid_updater
		@vent_line_coordinates.each do |vent_line|
			vent_line.each do |single_vent|
				# print "#{single_vent}\n"
				column, row = single_vent
				# puts "Row: #{row} #{row.class}, Column: #{column} #{column.class}"
				@vent_map[row][column] += 1
				# @vent_map.each { |line| print "#{line}\n"}
			end
		end
	end

	def map_tester
		@vent_map[5][5] = "Hello"
	end

	# function that checks "cards" to see if they have a winning row or column
	def count_danger_zones
		danger_zones = 0
		@vent_map.each do |line|
			danger_zones += line.select { |position| position > 1 }.count
		end
		return danger_zones
	end
end

# Changes the current working directory to the same as the ruby file that is running, allowing simple reference to text file
Dir.chdir(File.dirname(__FILE__))
# Reads the input.txt file and splits by line into an array
input = File.read("input.txt").split("\n")

#input = [
#	"0,9 -> 5,9",
#	"8,0 -> 0,8",
#	"9,4 -> 3,4",
#	"2,2 -> 2,1",
#	"7,0 -> 7,4",
#	"6,4 -> 2,0",
#	"0,9 -> 2,9",
#	"3,4 -> 1,4",
#	"0,0 -> 8,8",
#	"5,5 -> 8,2"
#]


vent_navigator = VentMapper.new(input)

#vent_navigator.vent_line_coordinates.each { |line| print "#{line}\n"}
#vent_navigator.vent_map.each { |line| print "#{line}\n"}
#puts vent_navigator.vent_map.size
#vent_navigator.map_tester

vent_navigator.grid_updater
#vent_navigator.vent_map.each { |line| print "#{line}\n"}
puts "Danger Zone Count: #{vent_navigator.count_danger_zones}"
