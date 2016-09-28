VALID_CHOICES = %w(rock paper scissors spock lizard)

WINNING_COMBOS = {
  rock: ['rock crushes lizard', 'rock crushes scissors'],
  paper: ['paper disproves spock', 'paper covers rock'],
  scissors: ['scissors cut paper', 'scissors decapitate lizard'],
  spock: ['spock smashes scissors', 'spock vaporizes rock'],
  lizard: ['lizard poisons spock', 'lizard eats paper']
}

RULES = <<-RULES
  ===  Game Rules ====

  Each round the player will choose rock, paper, scissors, spock or lizard. The
  computer will then choose from the same.  Both choices will be revealed at the
  same time and the winner will be determined by the heirarchy below.  The
  winner of the round will be awarded 1 point and the first to 5 wins the match.

  RULES

player_score = 0
computer_score = 0

def clear
  system 'cls'   # mac
  system 'clear' # windows
  puts 'Welcome to Rock - Paper - Scissors - Spock - Lizard'
  puts '==================================================='
end

def display_rules
  clear
  puts RULES
  WINNING_COMBOS.each do |_, row|
    row.map { |rule| puts "  #{rule}" }
    puts
  end
  puts '  ======================'
  print '  Press ENTER to go back'
  gets
  clear
end

def display_score(player, computer)
  clear
  puts "Current Score -- PLAYER: #{player} -- COMPUTER: #{computer}"
  puts
end

def win?(first, second)
  WINNING_COMBOS[first.to_sym].each do |rule|
    return true if rule.include?(second)
  end
  false
end

def get_result(first, second)
  return 'tie' if first == second
  return 'win' if win?(first, second)
  'lose'
end

def display_result(first, second)
  WINNING_COMBOS[first.to_sym].each do |rule|
    if rule.include?(second)
      puts "#{rule}!!"
      break
    end
  end
end

def eval_choice(input)
  case input
  when 'r' then 'rock'
  when 'p' then 'paper'
  when 's' then 'scissors'
  when 'ss' then 'spock'
  when 'l' then 'lizard'
  else input
  end
end

loop do
  clear
  puts '(R)ules ... (S)tart Game ... (Q)uit Game'
  action = gets.chomp.downcase

  # dislpay the rules of the game
  if action == 'r'
    clear
    display_rules

  # play the game
  elsif action == 's'
    loop do
      clear

      loop do
        # make your choice
        choice = ''
        loop do
          display_score(player_score, computer_score)
          puts '(R)Rock .. (P)Paper .. (S)Scissors .. (SS)Spock .. (L)Lizard'
          if choice == ''
            print 'What is your choice?: '
          else
            print 'Invalid Choice. Please choose from above: '
          end
          choice = gets.chomp.downcase
          choice = eval_choice(choice)
          break if VALID_CHOICES.include?(choice)
        end

        computer_choice = VALID_CHOICES.sample

        # determine winner
        puts
        puts "You chose: #{choice}; Computer chose: #{computer_choice}"
        result = get_result(choice, computer_choice)
# ----- move to method
        case result
        when 'tie'
          puts 'you tied!'
        when 'win'
          puts 'you won!'
        when 'lose'
          puts 'you lose!'
        end
# ----- end move to method
        gets
        break
      end
      break
    end

  elsif action == 'q'
    break

  else
    clear
    next
  end
end

clear
puts 'Thank you for playing! Goodbye.'
puts

puts win?('rock', 'lizard')
puts display_result('rock', 'lizard')

puts win?('rock', 'paper')
puts display_result('paper', 'rock')
