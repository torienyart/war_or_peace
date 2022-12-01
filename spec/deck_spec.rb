require './lib/card'
require './lib/deck'

describe Deck do
    it 'can add cards to deck' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3) 
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
# require 'pry'; binding.pry
        expect(cards).to eq([card1, card2, card3])

       # require 'pry'; binding.pry
    end

    it 'can pull card rank based on index' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3) 
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)

        expect(deck.rank_of_card_at(0)).to eq(12)
        expect(deck.rank_of_card_at(2)).to eq (14)
    end

    it 'can recognize high rank' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3) 
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
# require 'pry'; binding.pry
        expect(deck.high_ranking_cards).to eq([card1, card3])
    end

    it 'can determine percent high ranking' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3) 
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        deck.high_ranking_cards
        

        expect(deck.percent_high_ranking).to eq(66.67)
    end
end