class Lanternfish
  def initialize
    @timer = 8
  end

  def day_passed
    if @timer == 0
      Lanternfish.new
      @timer = 7
    else
      @timer -= 1
    end
  end
end