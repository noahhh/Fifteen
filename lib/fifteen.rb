class Fifteen
  attr_accessor :player1, :player2, :deck
  def initialize
    @player1 = []
    @player2 = []
    @deck = [1, 2, 3, 4, 5, 6, 7, 8, 9]
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
    if guess1 > 10
      puts "No.  Between 1 and 10"
      who_goes_first
    elsif guess1 < 0
      puts "No.  Between 1 and 10"
      who_goes_first
    end
    if num1 < 0
      num1.abs
    end
    if num2 < 0
      num2.abs
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

  def sum(array)
    array.inject{|sum, x| sum + x}
  end

  def winning
    hand = @player1.combination(3).to_a
    hand2 = @player2.combination(3).to_a
    if hand.any?{ |combination| sum(combination) == 15 }
      puts "Player wins!"
      play_again
    end
    if hand2.any?{ |combination| sum(combination) == 15 }
      puts "Computer wins!"
      play_again
    end
  end

  def play
    who_goes_first
    until winning
      pick1
      winning
      comp_pick
      winning
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
