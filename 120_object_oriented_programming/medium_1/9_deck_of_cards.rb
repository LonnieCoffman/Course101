class Card
  RANKS = %w(jack queen king ace)

  attr_reader :rank, :suit, :value
  include Comparable

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = rank.to_s.to_i == rank ? rank : 11 + RANKS.index(rank.downcase)
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def <=>(other)
    value <=> other.value
  end
end

class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    shuffle_deck
  end

  def shuffle_deck
    @deck = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        @deck << Card.new(rank, suit)
      end
    end
    @deck.shuffle!
  end

  def draw
    shuffle_deck if @deck.empty?
    @deck.pop
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.
