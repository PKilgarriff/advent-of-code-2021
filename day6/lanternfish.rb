class Lanternfish
  def initialize(timer = 8)
    @timer = timer
  end

  def day_passed
    if @timer == 0
      # I want to push a new instance to the instance variable on main
      @newborns << Lanternfish.new
      @timer = 6
    else
      @timer -= 1
    end
  end
end

@school = []
@newborns = []

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