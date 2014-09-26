  class Fifteen
    attr_accessor :player1, :player2, :deck
    def initialize
      @player1 = []
      @player2 = []
      @deck = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      # puts @deck
    end

    def who_goes_first
      puts "To decide who goes first, pick a number between 1 and 10"
      answer = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample
      guess1 = gets.chomp.to_i
      guess2 = rand(1..10)
      num1 = answer - guess1
      num2 = answer - guess2
      puts "The computer picked #{guess2}"
      puts "The number was #{answer}"
      if num1 < 0
        num1.abs
        # puts num1.abs
      end
      if num2 < 0
        num2.abs
        # puts num2.abs
      end
      if num1 < num2
        puts "player goes first"
        pick1
        comp_pick
        winning
      elsif num1 > num2
        puts "computer goes first"
        comp_pick
        winning
      elsif num1 == num2
        puts "Nobody wins.  Try again."
        who_goes_first
      end
    end


    def pick1
      puts "Pick a number #{@deck}"
      pick = gets.chomp.to_i
      if @deck.include?(pick)
      @player1 << pick.to_i
      end
      if @deck.include?(pick)
        @deck.delete_at(@deck.find_index(pick))
      else
        puts "Number not available, try again"
        pick1
      end
      puts "Your cards are #{@player1}"
      puts "The remaining cards are #{@deck}"
      puts " "
    end

    def comp_pick
      puts "Computers turn"
      pick2 = @deck.sample
      @player2 << pick2.to_i
      if @deck.include?(pick2)
        @deck.delete_at(@deck.find_index(pick2))
      else
        puts "Out of numbers"
        winning
        play_again
      end
      puts "The computer grabs the #{pick2}"
      puts "The computers cards are #{@player2}"
      puts " "
    end

    def winning
      if @player1.size == 3
        sum = @player1.reduce(:+)
      end
      if @player2.size == 3
        sum2 = @player2.reduce(:+)
      end
      if sum  == 15
        puts "Player wins!"
        play_again
      elsif sum2 == 15
        puts "Computer wins!"
        play_again
      end
    end

    def sum(array)
      array.inject{|sum, x| sum + x}
    end

    def winning_with_four
        hand = @player1.combination(3).to_a
        if hand.any?{ |combination| sum(combination) == 15 }
          puts "Player wins!"
          play_again
        end


      # count = 1
      # until count == 5
      # try = @player1
      # puts "I'M HERE"
      # try.rotate!(count).pop
      #   if try.reduce(:+) == 15
      #     puts "Player wins!"
      #   end
      # count += 1
      # end
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
    end

    # def winning_with_five
    #   if @player[0] + @player[3] + @player[4] == 15
    #       puts "Player wins!"
    #   elsif @player1[1] + @player1[2] + @player1[4] == 15
    #     puts "Player wins!"
    #   elsif @player1[1] + @player1[3] + @player1[4] == 15
    #     puts "Player wins!"
    #   elsif @player1[2] + @player1[3] + @player1[4] == 15
    #     puts "Player wins!"
    #     play_again
    #   end
    #   if @player2[0] + @player2[3] + @player2[4] == 15
    #     puts "Computer wins!"
    #   elsif @player2[1] + @player2[2] + @player2[4] == 15
    #     puts "Computer wins!"
    #   elsif @player2[1] + @player2[3] + @player2[4] == 15
    #     puts "Computer wins!"
    #   elsif @player2[2] + @player2[3] + @player2[4] == 15
    #     puts "Computer wins!"
    #     play_again
    #   end
    #   if @deck == []
    #     puts "Nobody wins"
    #     play_again
    #   end
    # end

    def play
      #who_goes_first
      until winning
        pick1
        winning
        comp_pick
        winning
        if @player1.size > 3 && @player2.size > 3
          winning_with_four
        end
      end
    end

    def play_again
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      if answer == "y"
        game = Fifteen.new
        game.play
      elsif answer == "n"
        puts "Goodbye."
        exit
      else
        puts "I'll take that as a no"
        exit
      end
    end

  end
  game = Fifteen.new
  game.play
