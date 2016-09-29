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

START_MESSAGE = <<-START
  ................................................

  The first to 5 wins.
  Make your selection below to begin.

  ................................................

  START

RESULTS_MESSAGE = <<-RESULTS
  ................................................
  You picked: {player}
  Computer Picked: {computer}

  {rule}........YOU {outcome}!
  ................................................

RESULTS

GAMEOVER_MESSAGE = <<-GAMEOVER
................................................
Game Over! You {result}!

Well played!

................................................
GAMEOVER

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
  return '' if first.empty? || second.empty?
  return 'tie' if first == second
  return 'win' if win?(first, second)
  'lose'
end

def get_rule(first, second)
  WINNING_COMBOS[first.to_sym].each do |rule|
    return "#{rule}!!" if rule.include?(second)
  end
end

def display_result(player, computer, outcome)
  if outcome == ''
    puts START_MESSAGE
  else
    rule = 'Great Minds Think Alike'
    rule = get_rule(player, computer) if outcome == 'win'
    rule = get_rule(computer, player) if outcome == 'lose'
    puts RESULTS_MESSAGE
      .gsub('{player}', player).gsub('{computer}', computer)
      .gsub('{rule}', rule.upcase).gsub('{outcome}', outcome.upcase)
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
      choice = ''
      computer_choice = ''
      result = ''
      player_score = 0
      computer_score = 0
      loop do
        break if player_score == 5 || computer_score == 5
        loop do
          result = get_result(choice, computer_choice)
          player_score += 1 if result == 'win'
          computer_score += 1 if result == 'lose'
          display_score(player_score, computer_score)
          display_result(choice, computer_choice, result)

          choice = ''
          computer_choice = ''

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
