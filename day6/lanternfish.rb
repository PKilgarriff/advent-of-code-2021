class Lanternfish
  attr_reader :timer

  def initialize(timer = 8)
    @timer = timer
  end

  def day_passed(school)
    if @timer == 0
      school.spawn_newborn
      @timer = 6
    else
      @timer -= 1
    end
  end
end

class School
  def initialize(input)
    @school = input.split(',').map { |timer| Lanternfish.new(timer.to_i) }
    reset_newborns
  end
  
  def advance_days(number)
    number.times { day_passed }
  end
  
  def school_size
    @school.size
  end

  def print_timers
    timers = @school.map { |fish| fish.timer }
    p timers
  end
  
  def spawn_newborn
    @newborns << Lanternfish.new
  end

  private

  def reset_newborns
    @newborns = []
  end

  def add_newborns_to_school
    @school.push(*@newborns)
    reset_newborns
  end

  def day_passed
    @school.each { |fish| fish.day_passed(self) }
    # puts "#{@newborns.size} newborn lanternfish spawned"
    add_newborns_to_school
  end

end

# input = "3,4,3,1,2"

# Changes the current working directory to the same as the ruby file that is running, allowing simple reference to text file
Dir.chdir(File.dirname(__FILE__))
# Reads the input.txt file
input = File.read("input.txt")

# Exercise 1
school1 = School.new(input)
school1.advance_days(80)
puts school1.school_size

# Exercise 2
school2 = School.new(input)
school2.advance_days(256)
puts school2.school_size

# Create a lanternfish class
# Allow instances of the lanternfish class to manage their own timers
# each day that passes all the lanternfish should 'age' by one day
  # this will be reducing their internal timer
# When the internal timer hits zero - spawn a new lanternfish
  # reset the timer at the same time

# map the input to an array of lanternfish objects, each using the number as their initial age
# once you have an array of lanternfish instances, you have the initial set of fish
# each day that passes, all the fish should have the day_passed method called
# the fish that spawn new fish should push them to an array of "newborns"
# Once all the fish that began the day have experienced a day passing, add the newborns to the main array
# repeat the above until 80 days have passed
# count the size of the array (Potentially mahussive)

#### OR #####
# Make the school of fish a class
# It can hold the main school
# It can add_newborns
# It can hold the newborns
# It can return the size of the school
# It can increment by days?