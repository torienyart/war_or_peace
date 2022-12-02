require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


#create 52 cards
cards = []
value = 1
rank = 1

cards << Card.new(:diamond, 'Ace', 1)

9.times do
    suit = :diamond
    value += 1
    rank += 1
    cards << Card.new(suit, value, rank)

end

cards << Card.new(:diamond, 'Jack', 11)
cards << Card.new(:diamond, 'Queen', 12)
cards << Card.new(:diamond, 'King', 13)

value = 1
rank = 1

cards << Card.new(:heart, 'Ace', 1)

9.times do
    suit = :heart
    value += 1
    rank += 1
    cards << Card.new(suit, value, rank)

end

cards << Card.new(:heart, 'Jack', 11)
cards << Card.new(:heart, 'Queen', 12)
cards << Card.new(:heart, 'King', 13)

value = 1
rank = 1

cards << Card.new(:club, 'Ace', 1)

9.times do
    suit = :club
    value += 1
    rank += 1
    cards << Card.new(suit, value, rank)

end

cards << Card.new(:club, 'Jack', 11)
cards << Card.new(:club, 'Queen', 12)
cards << Card.new(:club, 'King', 13)

value = 1
rank = 1

cards << Card.new(:spade, 'Ace', 1)

9.times do
    suit = :spade
    value += 1
    rank += 1
    cards << Card.new(suit, value, rank)

end

cards << Card.new(:spade, 'Jack', 11)
cards << Card.new(:spade, 'Queen', 12)
cards << Card.new(:spade, 'King', 13)

#create two decks w/ random assignment of 26 cards
shuffled_cards = cards.shuffle 
random_half_1 = shuffled_cards[1..26]
random_half_2 = shuffled_cards[26..52]

deck1 = Deck.new(random_half_1)
deck2 = Deck.new(random_half_2)

# Create two players with the Decks you created
player1 = Player.new('Jimbo', deck1)
player2 = Player.new('Pam', deck2)

#start the game using a new method called start
class GamePlay
    
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2

    end


    def start
        1000000.times do
            if @player1.deck.cards.size > 0 || @player2.deck.cards.size > 0
                new_turn = Turn.new(@player1, @player2)
                new_turn.type
                winner = new_turn.winner
                new_turn.pile_cards
                new_turn.award_spoils(winner)
                if new_turn.type == :basic
                    p "#{winner.name} won 2 cards"
                elsif new_turn.type == :war
                    p "WAR - #{winner.name} won 6 cards"
                elsif new_turn.type == :mutually_assured_destruction
                    p "**mUtuAlLy asSUreD dEsTrUctIOn** 6 cards REMOVED from play"
                end
            end
        end  
        
        if @player1.deck.cards.size == 52
            p "*~*~*~* #{@player1.name} has conquered all! *~*~*~*" 
        elsif @player2.deck.cards.size == 52
            p "*~*~*~* #{@player2.name} has conquered all! *~*~*~*"
        else
            p "---- DRAW; PEACE IS AMONG US ----"
        end
    end

    # def winner
    #     if @player1.deck.cards.size == 52
    #         p "*~*~*~* #{@player1.name} has conquered all! *~*~*~*" 
    #     elsif @player2.deck.cards.size == 52
    #         p "*~*~*~* #{@player2.name} has conquered all! *~*~*~*"
    #     else
    #         p "---- DRAW; PEACE IS AMONG US ----"
    #     end
    # end

end

#Welcome Message

p "Welcome to War! (or Peace) This game will be played with 52 cards."

p "The players today are Jimbo and Pam (Michael, please leave them alone!)."

p "Type 'GO' to start the game!"

p -------------------------------------------------------------------------------

user_input = gets.chomp

if user_input.upcase == "GO"
    new_game = GamePlay.new(player1, player2)
    new_game.start
    # new_turn = Turn.new(player1, player2)
    # new_turn.start
end