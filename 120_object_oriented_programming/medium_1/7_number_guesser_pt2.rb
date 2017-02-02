class Guesser
  LOW_MSG = 'Your guess is too low'
  HIGH_MSG = 'Your guess is too high'
  WIN_MSG = 'You win!'
  LOSE_MSG = 'You are out of guesses. You lose.'

  def initialize(range_begin, range_end)
    @range = (range_begin..range_end)
    @guesses = Math.log2(range_end - range_begin).to_i + 1
  end

  def play
    @number = rand(@range)
    while @guesses > 0
      display_remaining(@guesses)
      @eval = eval_guess(obtain_guess)
      break if @eval.zero?
      @guesses -= 1
    end
    puts
    puts @eval.zero? ? WIN_MSG : LOSE_MSG
  end

  private

  def eval_guess(guess)
    evaluation = guess <=> @number
    case evaluation
    when -1 then puts LOW_MSG
    when 1 then puts HIGH_MSG
    end
    evaluation
  end

  def obtain_guess
    loop do
      puts "Enter a number between #{@range.first} and #{@range.last}: "
      guess = gets.chomp.to_i
      return guess if @range.cover? guess
      puts "Invalid guess. Enter a number between #{@range.first} and #{@range.last}:"
    end
  end

  def display_remaining(remaining)
    puts
    word = remaining == 1 ? 'guess' : 'guesses'
    puts "You have #{@guesses} #{word} remaining"
  end
end

game = Guesser.new(501, 1500)
game.play
