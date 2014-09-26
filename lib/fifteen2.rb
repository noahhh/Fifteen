class Fifteen
    attr_accessor :player1, :player2, :deck
    def initialize
      @player1 = []
      @player2 = []
      @deck = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      # puts @deck
    end

    def pick1
      puts "Pick"
      pick = gets.chomp.to_i
      @player1 << pick
      # @deck.delete(@pick)
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

    def winning
      if @player1.size >=3
      sum = @player1.reduce(:+)
      end
      if @player2.size >=3
      sum2 = @player2.reduce(:+)
      end
      if sum  == 15
        puts "Player wins!"
        exit
      elsif sum2 == 15
        puts "Computer wins!"
        exit
      end
    end

    def winning_with_four
      if @player1[0] + @player1[1] + @player1[3] == 15
      puts "Player wins!"
      elsif @player1[0] + @player1[2] + @player1[3] == 15
      puts "Player wins!"
      elsif @player1[1] + @player1[2] + @player1[3] == 15
      puts "Player wins!"
      exit
      end
    end

    def play
      until winning
        pick1
        comp_pick
        if @player1.size > 3
          winning_with_four
        end
      end
    end
end
  game = Fifteen.new
  game.play
