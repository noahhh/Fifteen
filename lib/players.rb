class Player
	def initialize
		@player1 = []
		@player2 = []
		@deck = [1, 2, 3, 4, 5, 6, 7, 8, 9]
	end

	def pick1
		puts "Pick a number 1-9"
		pick = gets.chomp.to_i
		@player1 << pick
		@deck.delete(pick)
		@deck.delete_at(@deck.find_index(pick))
		puts "The remaining cards are #{@deck}"
	end

	def comp_pick
		puts "Computers turn"
		pick2 = @deck.sample
		@deck.delete_at(@deck.find_index(pick2))
		puts "The computer grabs the #{pick2}"
		puts "The remaining cards are #{@deck}"
	end
end
