class Fifteen
  attr_accessor :player1, :player2, :deck
  
  def initialize
    @player1 = []
    @player2 = []
    @deck = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    who_goes_first
  end

  def who_goes_first
    puts "Choose between 1 or 2"
    answer = rand(1..2)
    number = gets.chomp.to_i
    if number > 2 || number < 1
      puts "Wrong."
      who_goes_first
    end
    if number == answer
      puts "Player goes first"
        play
    else
      puts "Computer goes first"
      comp_pick
      play
    end
  end

  def pick1
    puts "Pick a number #{@deck}"
    pick = gets.chomp.to_i
    if @deck.include?(pick)
      @player1 << pick.to_i
    end
    if @deck.include?(pick)
      @deck.delete(pick)
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
      @deck.delete(pick2)
    else
      puts "Out of numbers"
      winning
      play_again
    end
      puts "The computer grabs the #{pick2}"
    if @player2.size > 1
      puts "The computers cards are #{@player2}"
    end
    puts " "
  end

  def sum(array)
    array.inject{|sum, x| sum + x}
  end

  def player_wins?
    hand = @player1.combination(3).to_a
    hand.any?{ |combination| sum(combination) == 15 }
  end

  def computer_wins?
    hand2 = @player2.combination(3).to_a
    hand2.any?{ |combination| sum(combination) == 15 }
  end

  def winning
    if player_wins?
      puts "Player wins!"
      play_again
    elsif computer_wins?
      puts "Computer wins!"
      play_again
    end
  end

  def play
    until winning
      pick1
      comp_pick
    end
  end

  def play_again
    puts "Would you like to play again? (y/n)"
    answer = gets.chomp.downcase
    if answer == "y" || answer == "yes"
      game = Fifteen.new
      game.play
    elsif answer == "n" || answer == "no"
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
