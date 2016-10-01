VALID_CHOICES = %w(rock paper scissors lizard spock)

WINNING_COMBOS = {
  rock: ['rock crushes lizard', 'rock crushes scissors'],
  paper: ['paper disproves spock', 'paper covers rock'],
  scissors: ['scissors cut paper', 'scissors decapitate lizard'],
  spock: ['spock smashes scissors', 'spock vaporizes rock'],
  lizard: ['lizard poisons spock', 'lizard eats paper']
}

RULES = <<-RULES
  ===  Game Rules ====

  Each round the player will choose rock, paper, scissors, lizard or spock. The
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
  Game Over! You {result} This Round!

  Wanna Play Again?
  ................................................
  Press ENTER to play again or Q to quit.
GAMEOVER

def clear
  system 'cls'   # mac
  system 'clear' # windows
end

def display_header
  puts 'Welcome to Rock - Paper - Scissors - Lizard - Spock'
  puts '==================================================='
end

def display_options
  puts '(H)ow to play ... (Q)uit Game'
  puts
end

def display_rules
  puts RULES
  WINNING_COMBOS.each do |_, row|
    row.each { |rule| puts "  #{rule}" }
    puts
  end
  puts '  ======================'
  print '  Press ENTER to go back'
  gets
  clear
end

def display_score(player, computer)
  puts "Current Score -- PLAYER: #{player} -- COMPUTER: #{computer}"
  puts
end

def win?(first, second)
  WINNING_COMBOS[first.to_sym].each do |rule|
    return true if rule.include?(second)
  end
  false
end

def game_over?(player, computer)
  player >= 5 || computer >= 5
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

def get_outcome_message(player, computer, outcome)
  rule = 'Great Minds Think Alike'
  rule = get_rule(player, computer) if outcome == 'win'
  rule = get_rule(computer, player) if outcome == 'lose'
  rule
end

def display_result(player, computer, outcome, rule)
  if outcome == ''
    puts START_MESSAGE
  else
    puts <<-RESULTS
  ................................................
    You picked: #{player}
    Computer Picked: #{computer}

    #{rule.upcase}........YOU #{outcome.upcase}!
  ................................................

    RESULTS
  end
end

def display_choice_prompt(input)
  puts '(R)Rock .. (P)Paper .. (S)Scissors .. (L)Lizard .. (SS)Spock'
  if %w(r p s l ss h).include?(input) || input.empty?
    print 'What is your choice? : '
  else
    print 'That is an invalid choice.  Choose again : '
  end
end

def display_game_over(player, computer)
  outcome = player > computer ? 'Won' : 'Lost'
  puts <<-GAMEOVER
    Game Over! You #{outcome} This Round!

    Wanna Play Again?
    ................................................
    Press ENTER to play again or Q to quit.
  GAMEOVER
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

def exit_game
  puts
  puts 'Thank you for playing! Goodbye.'
  puts
  puts
  exit
end

# start game loop
loop do
  # reset game variables
  choice = ''
  computer_choice = ''
  result = ''
  action = ''
  player_score = 0
  computer_score = 0
  valid = false
  # start game
  loop do
    # update score
    if valid && action != 'h'
      result = get_result(choice, computer_choice)
      player_score += 1 if result == 'win'
      computer_score += 1 if result == 'lose'
    end

    outcome_message = get_outcome_message(choice, computer_choice, result)
    # display current score and results
    clear
    display_header
    display_options
    display_score(player_score, computer_score)
    display_result(choice, computer_choice, result, outcome_message)

    # check if game has been won
    if game_over?(player_score, computer_score)
      display_game_over(player_score, computer_score)
      again = gets.chomp.downcase
      if again == 'q'
        clear
        display_header
        exit_game
      end
      break
    end

    # get player input
    valid = true
    # get input
    display_choice_prompt(action)

    action = gets.chomp.downcase

    if action == 'q'
      clear
      display_header
      exit_game
    elsif action == 'h'
      clear
      display_header
      display_rules
    elsif !(%w(r p s l ss).include? action)
      valid = false
    end

    if action != 'h' && valid
      choice = eval_choice(action)
      computer_choice = VALID_CHOICES.sample
    end
  end
end
