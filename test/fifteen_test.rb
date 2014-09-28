require "minitest/autorun"
require "fifteen"
#require_relative
#::Unit::TestCase
class FifteenTest < Minitest::Unit::TestCase
	# def setup
	# 	@game = Fifteen.new
	# end

	# def test_who_goes_first_player_can_only_pick_1_or_2
	# end

	def test_player_can_not_pick_above_or_below_1_through_9
		pick = 47
		assert_equal @deck.include?(pick), false
	end

	def test_player_can_only_pick_what_is_in_deck
		@deck = [1, 2, 3, 4, 6, 7, 8, 9]
		pick = 5
		assert_equal @deck.include?(pick), false
	end

	def test_can_only_win_with_3_cards_as_15
		game = Fifteen.new
		@player1 = [4, 6, 3, 2]
		assert_equal game.winning, false
	end

	def test_game_ends_when_someone_hits_15_with_3_cards
		game = Fifteen.new
		@player1 = [8, 6, 1]
		assert_equal game.winning, true
	end

	# def play_again_only_takes_y_yes_n_no
	# end
end
