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
    number = gets.chomp.to_i # Test isn't liking gets
    if number > 2 || number < 1 # Player can't pick under 1 or above 2
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

  def pick1 # pick for players hand
    puts "Pick a number #{@deck}"
    pick = gets.chomp.to_i
    if @deck.include?(pick) # If deck includes #, put it in hand
      @player1 << pick.to_i
    end
    if @deck.include?(pick) # If deck includes #, delete it from deck
      @deck.delete(pick)
    else
      puts "Number not available, try again"
      pick1
    end
    puts "Your cards are #{@player1}"
    puts "The remaining cards are #{@deck}"
    puts " "
  end

  def comp_pick # pick for computers hand
    puts "Computers turn"
    pick2 = @deck.sample
    @player2 << pick2.to_i # If deck includes #, put it in hand
    if @deck.include?(pick2)
      @deck.delete(pick2) # If deck includes #, delete it from deck
    else
      puts "Out of numbers"
      winning
      play_again
    end
    puts "The computer grabs the #{pick2}"
    puts "The computers cards are #{@player2}"
    puts " "
  end

  def sum(array) # To use in winning
    array.inject{|sum, x| sum + x} #Take sum and next number, and continously add them
  end

  def winning # check combinations for equalling 15
    hand = @player1.combination(3).to_a # combination makes every possible combination from array with (3) numbers from it
    hand2 = @player2.combination(3).to_a
    if hand.any?{ |combination| sum(combination) == 15 } # uses sum method from above
      puts "Player wins!"
      play_again
    end
    if hand2.any?{ |combination| sum(combination) == 15 } # uses sum method from above
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
