puts "Welcome to Blackjack!"
puts "You have $100, but it's a $10 fee per game."
puts "Let's play!"
class BlackJack
  def initialize
    @player = Player.new
    @dealer = Dealer.new
  end

  def play
    def initialiaze
      @user_answer = gets.chomp
    end
    while @player.money > 10 do
      @player.money -= 10
      puts "Now you have $#{@player.money}."
      card_one = @player.cards.hit
      card_two = @player.cards.hit
      player_value = card_one + card_two
      dealer_one = @dealer.cards.hit
      dealer_two = @dealer.cards.hit

      puts "Your cards are: #{card_one} and  #{card_two}"
      puts "Your total is #{player_value}"
        if player_value == 21
          puts "Congratulations, you got Black Jack!"
        end
      puts "Would you like another card? (y or n)?"
      @user_answer = gets.chomp
        if @user_answer == "y"
          card_three = @player.cards.hit
          hit_value = player_value + card_three
          puts "Okay, here's your new card #{card_three}. Good luck"
          puts "Your new total is #{hit_value}"
          if hit_value == 21
            puts "Congratulations, you got Black Jack!"
          elsif hit_value > 21
            puts "Sorry, you busted!"
          elsif hit_value < 21
            puts "Would you like another card? (y or n)?"
            @user_answer = gets.chomp
            if @user_answer == "y"
              card_four = @player.cards.hit
              hit_value2 = hit_value + card_four
              dealer_value = dealer_one + dealer_two
              puts "Okay, here's your new card #{card_four}. Good luck"
              puts "Your new total is #{hit_value2}"
                if hit_value2 == 21
                  puts "Congratulations, you got Black Jack!"
                elsif hit_value > 21
                  puts "Sorry, you busted!"
                elsif hit_value < 21
                  puts "Okay, let's see what the dealer got!"
                  dealer_value = dealer_one + dealer_two
                  puts "The dealer got: #{dealer_value}"
              #puts "Would you like another card? (y or n)?"
              #@user_answer = gets.chomp
              #if @user_answer == "y"
                #card_four = @player.cards.hit
                #hit_value2 = hit_value + card_four
                #dealer_value = dealer_one + dealer_two
                #puts "Okay, here's your new card #{card_four}. Good luck"
                #puts "Your new total is #{hit_value2}"







                #if hit_value2 < dealer_value
                #puts "Sorry, you lost."
                #elsif hit_value2 >= dealer_value
                #puts "Congratulations, you won!"
                #end
            #else
              #puts "Okay, let's see what the dealer got!"
              #dealer_value = dealer_one + dealer_two
              #puts "The dealer got: #{dealer_value}"
            end
            hit_value2 = hit_value + card_four
            dealer_value = dealer_one + dealer_two
              if hit_value2 < dealer_value
                puts "Sorry, you lost."
              elsif hit_value2 >= dealer_value
                puts "Congratulations, you won!"
            end
          end
        end
        else
          puts "You chose to stay! Let's see wthat the dealer got!"
          puts "The dealer got: #{dealer_value}"
          dealer_value = dealer_one + dealer_two
            if player_value < dealer_value
              puts "Sorry, you lost."
            elsif player_value >= dealer_value
              puts "Congratulations, you won!"
            end
        end

    end
  end
  #How could I incorporate this?
  def sum_player_hand(player_hand)
    player_hand.reduce(:+)
  end
end

class Player
  attr_accessor :cards, :money
  def initialize
    @cards = Deck.new
    @money = 100
  end
end

class Dealer
  attr_accessor :cards
  def initialize
    @cards = Deck.new
  end
end


class Deck
  attr_reader :cards
  def initialize
    faces = [10] * 4
    aces = [11] * 4
    @cards = ((2..9).to_a * 4).concat(faces).concat(aces).shuffle
  end

  def shuffle
    @cards = @cards.shuffle
  end

  def deal
    @cards.shift(2)
  end

  def hit
    @cards.shift
  end
end

BlackJack.new.play


