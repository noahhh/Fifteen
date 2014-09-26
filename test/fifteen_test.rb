require "minitest/autorun"
require "fifteen"

class FifteenTest < Minitest::Test
   def initialize
      @game = Fifteen.new
   end
  # def test_if_game_has_two_players
  #   @game = Fifteen.new
  #   refute nil @game.@player1
  #   refute nil @game.@player2
  # end

  def test_deck_has_values
      assert_equal @deck, [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

end


# count = 0
# @player1.delete_at(count)
# if count == 0
#   print first = @player1
# elsif count == 1
#   print second = @player1
# elsif count == 2
#   print third = @player1
# elsif count == 3
#   print fourth == 4
# else
#   print "error"
# end
# count += 1
