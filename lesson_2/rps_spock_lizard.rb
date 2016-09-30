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
  Press Enter to play again or Q to quit.
GAMEOVER

player_score = 0
computer_score = 0

def clear
  system 'cls'   # mac
  system 'clear' # windows
  puts 'Welcome to Rock - Paper - Scissors - Lizard - Spock'
  puts '==================================================='
  puts '(H)ow to play ... (Q)uit Game'
  puts
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

def display_choice_prompt(input)
  if %w(r p s l ss h).include?(input) || input.empty?
    print 'What is your choice? : '
  else
    print 'That is an invalid choice.  Choose again : '
  end
end

def display_game_over(player, computer)
  outcome = player > computer ? 'Won' : 'Lost'
  puts GAMEOVER_MESSAGE.gsub('{result}', outcome)
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
  clear
  puts 'Thank you for playing! Goodbye.'
  puts
  puts
  exit
end

# start game loop
loop do
  clear
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
      puts 'update score'
    end

    # display current score and results
    display_score(player_score, computer_score)
    display_result(choice, computer_choice, result)

    # check if game has been won
    if game_over?(player_score, computer_score)
      display_game_over(player_score, computer_score)
      again = gets.chomp.downcase
      exit_game if again == 'q'
      break
    end

    # get player input
    valid = true
    # get input
    puts '(R)Rock .. (P)Paper .. (S)Scissors .. (L)Lizard .. (SS)Spock'
    display_choice_prompt(action)

    action = gets.chomp.downcase

    if action == 'q'
      exit_game
    elsif action == 'h'
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
