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


#
# if @player1[0] + @player1[1] + @player1[3] == 15
#   puts "Player wins!"
#   play_again
# elsif @player1[0] + @player1[2] + @player1[3] == 15
#   puts "Player wins!"
#   play_again
# elsif @player1[1] + @player1[2] + @player1[3] == 15
#   puts "Player wins!"
#   play_again
# end
# if @player2[0] + @player2[1] + @player2[3] == 15
#   puts "Computer wins!"
#   play_again
# elsif @player2[0] + @player2[2] + @player2[3] == 15
#   puts "Computer wins!"
#   play_again
# elsif @player2[1] + @player2[2] + @player2[3] == 15
#   puts "Computer wins!"
#   play_again
# end
# if @deck == []
#   puts "Nobody wins"
#   play_again
# end
# if @player1.size > 4 && @player2.size > 4
#   winning_with_five
# end
#end
