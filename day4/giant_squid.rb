class SquidBingo
	attr_reader :bingo_cards

	def initialize(bingo_cards)
		@bingo_cards = []
		bingo_cards.each do |card|
			#puts card_number
			lines = card.split("\n")
			lines.map! { |line| line.split() }
			for i in 0...lines.size
				lines[i].map!(&:to_i)
			end
			@bingo_cards.push(lines)
		end
		puts "#{@bingo_cards.size} Bingo Cards"
		@remaining_bingo_cards = @bingo_cards
	end

	card = [
		[1,2,3,4,5],
		[1,2,3,4,5],
		[1,2,3,4,5],
		[1,2,3,4,5],
		[1,2,3,4,5]
	]

	# function that checks "cards" to see if they have a winning row or column
	def is_winner?(card)
		card.any? { |line| line.all? { |digit| digit == "X" } } or card.transpose.any? { |line| line.all? { |digit| digit == "X" } }
	end

	# function that takes an input integer, then replaces all instances of it in the bingo cards with the character "X"
	def find_winning_card(called_number)
		@bingo_cards.map! { |card| card.map! { |line| line.map! { |number| number == called_number ? "X" : number} } }
		if @bingo_cards.any? { |card| is_winner?(card) }
			puts "WE HAVE A WINNER with #{called_number}"
			# if the is_winner? function returns true for a particular card then that is the first card that wins, and so we start to score it
			winning_card = @bingo_cards.select { |card| is_winner?(card) }
			score_winning_card(called_number, winning_card)
			return true
		end
		return false
	end

	def find_last_winning_card(called_number)
		@remaining_bingo_cards.map! { |card| card.map! { |line| line.map! { |number| number == called_number ? "X" : number} } }
		if @remaining_bingo_cards.size != 1
			# strip any winners unless there's only one card left
			@remaining_bingo_cards.select! { |card| !(is_winner?(card)) }
		elsif @remaining_bingo_cards.size == 1 && @remaining_bingo_cards.any? { |card| is_winner?(card) }
			# send the @remaining_bingo_cards array across as it only contains the winning card
			score_winning_card(called_number, @remaining_bingo_cards)
			return true
		end
		return false
	end

	# function that strips out all "X"s and then sums the remaining numbers => score for bingo
	def score_winning_card(called_number, winning_card)
		print "#{winning_card}\n"
		card_score = 0
		winning_card[0].each do |line|
			line.each { |entry| card_score += entry if entry != "X" }
		end
		puts "Card Score: #{card_score}, Last Called: #{called_number}, Total Score: #{card_score * called_number}"
	end
end

# puts Dir.pwd
# Changes the current working directory to the same as the ruby file that is running, allowing simple reference to text file
Dir.chdir(File.dirname(__FILE__))
# Reads the input.txt file and splits by line into an array
#input = File.read("input.txt", mode: "rb").split
numbers_to_call = File.read("numbers_called.txt").split(",").map(&:to_i)
bingo_cards = File.read("bingo_cards.txt").split("\n\n")

squingo = SquidBingo.new(bingo_cards)

numbers_to_call.each do |number|
	break if squingo.find_winning_card(number)
end

numbers_to_call.each do |number|
	break if squingo.find_last_winning_card(number)
end