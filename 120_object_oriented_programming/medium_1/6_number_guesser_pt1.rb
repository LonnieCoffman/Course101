class PingGame
  LOW_MSG = 'Your guess is too low'
  HIGH_MSG = 'Your guess is too high'
  WIN_MSG = 'You win!'
  LOSE_MSG = 'You are out of guesses. You lose.'
  RANGE = (1..100)
  GUESSES = 7

  def play
    @number = rand(RANGE)
    @guesses = GUESSES
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
      puts "Enter a number between #{RANGE.first} and #{RANGE.last}: "
      guess = gets.chomp.to_i
      return guess if RANGE.cover? guess
      puts "Invalid guess. Enter a number between #{RANGE.first} and #{RANGE.last}:"
    end
  end

  def display_remaining(remaining)
    puts
    word = remaining == 1 ? 'guess' : 'guesses'
    puts "You have #{@guesses} #{word} remaining"
  end
end

game = PingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low
#
# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low
#
# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high
#
# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80
#
# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# You win!
