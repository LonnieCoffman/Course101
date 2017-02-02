class Card
  RANKS = %w(jack queen king ace).freeze

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

class PokerHand
  def initialize(deck)
    @hand = []
    5.times { @hand << deck.draw }
  end

  def print
    @hand.each do |card|
      puts "#{card.rank} of #{card.suit}"
    end
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    flush? && @hand.min_by(&:value).value == 10
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    matching_values? == 3
  end

  def full_house?
    matching_values? == 6
  end

  def flush?
    @hand.uniq(&:suit).size == 1
  end

  def straight?
    @hand.min_by(&:value).value + 4 == @hand.max_by(&:value).value
  end

  def three_of_a_kind?
    matching_values? == 2
  end

  def two_pair?
    matching_values? == 4
  end

  def pair?
    matching_values? == 1
  end

  def matching_values?
    matches = @hand - @hand.uniq(&:value)
    pairs = matches.size
    unique_pairs = matches.uniq(&:value).size
    pairs * unique_pairs
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate
