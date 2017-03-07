module Displayable
  VALID_CHOICES = %w(rock paper scissors lizard spock)

  WINNING_COMBOS = {
    rock: ['rock crushes lizard', 'rock crushes scissors'],
    paper: ['paper disproves spock', 'paper covers rock'],
    scissors: ['scissors cut paper', 'scissors decapitate lizard'],
    spock: ['spock smashes scissors', 'spock vaporizes rock'],
    lizard: ['lizard poisons spock', 'lizard eats paper']
  }.freeze

  RULES = <<-RULES
    ===  Game Rules ====
    Each round the player will choose rock, paper, scissors, lizard or spock. The
    computer will then choose from the same.  Both choices will be revealed at the
    same time and the winner will be determined by the heirarchy below.  The
    winner of the round will be awarded 1 point and the first to 5 wins the match.
    RULES

  def display_initial_ui
    clear_screen
    display_header
    puts "You are playing against #{computer.name}."
    puts
  end

  def display_upper_ui
    clear_screen
    display_header
    display_options
    display_score
    display_divider
  end

  def display_lower_ui
    display_divider
    display_choices
  end

  def display_game_start_ui
    display_upper_ui
    puts 'The first to 5 wins.'
    puts 'Make your selection below to begin.'
    display_lower_ui
  end

  def display_move_ui
    display_upper_ui
    puts "You picked: #{human.move}"
    puts "Computer Picked: #{computer.move}"
    puts
    puts outcome_message
    display_lower_ui
  end

  def outcome_message
    return 'Great Minds Think Alike.....You Tie!' if @outcome == 'tie'
    return get_rule(human.move, computer.move) if @outcome == 'win'
    get_rule(computer.move, human.move)
  end

  def get_rule(first, second)
    WINNING_COMBOS[first.to_sym].each do |rule|
      return "#{rule}!!" if rule.include?(second)
    end
  end

  def clear_screen
    system 'cls' # mac
    system 'clear' # windows / linux
  end

  def display_header
    puts 'Welcome to Rock - Paper - Scissors - Lizard - Spock'
    puts '==================================================='
  end

  def display_divider
    puts '................................................'
  end

  def display_goodbye_message
    puts
    puts 'Thank you for playing. Good bye.'
    puts
  end

  def display_options
    puts '(H)ow to Play ... (M)ove History .. (Q)uit Game'
    puts
  end

  def display_choices
    puts
    puts '(R)Rock .. (P)Paper .. (S)Scissors .. (L)Lizard .. (SS)Spock'
  end

  def display_rules
    clear_screen
    puts RULES
    WINNING_COMBOS.each do |_, row|
      row.each { |rule| puts "  #{rule}" }
      puts
    end
    puts '  ======================'
    print '  Press ENTER to go back'
    gets
    clear_screen
  end

  def display_score
    puts "Current Score -- #{human.name.upcase}: #{human.score}" \
         " -- #{computer.name.upcase}: #{computer.score}"
    puts
  end
end

class Player
  attr_accessor :name, :move, :score

  def initialize
    set_name
    @score = Score.new
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      print "What is your name? : "
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose(selection)
    self.move = case selection
                when 'r' then 'rock'
                when 'p' then 'paper'
                when 's' then 'scissors'
                when 'ss' then 'spock'
                when 'l' then 'lizard'
                end
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Game::VALID_CHOICES.sample
  end
end

class Score
  attr_reader :current_score

  def initialize
    @score = 0
  end

  def increment
    @score += 1
  end

  def to_s
    @score.to_s
  end
end

class Game
  include Displayable

  attr_accessor :human, :computer

  def initialize
    @computer = Computer.new
    display_initial_ui
    @human = Human.new
    @option = nil
    @outcome = nil
  end

  def play
    display_game_start_ui
    loop do
      user_input
      %w(h m q).include?(@option) ? select_option : select_moves
      if %w(r p s l ss).include? @option
        determine_outcome
        update_score
      end
      human.move.nil? ? display_game_start_ui : display_move_ui
    end
  end

  def user_input
    input = ''
    loop do
      if input == ''
        print "What is your choice? : "
      else
        print "That is an invalid choice.  Choose again :"
      end
      input = gets.chomp.downcase
      break if %w(h m q r p s l ss).include? input
      human.move.nil? ? display_game_start_ui : display_move_ui
    end
    @option = input
  end

  def select_option
    case @option
    when 'h' then display_rules
    when 'm'
      puts 'history'
      gets
    when 'q' then exit_game
    end
  end

  def select_moves
    human.choose @option
    computer.choose
  end

  def determine_outcome
    return @outcome = 'tie' if human.move == computer.move
    WINNING_COMBOS[human.move.to_sym].each do |rule|
      return @outcome = 'win' if rule.include? computer.move
    end
    @outcome = 'lose'
  end

  def update_score
    if (@outcome != 'tie') && (%w(r p s l ss).include? @option)
      @outcome == 'win' ? human.score.increment : computer.score.increment
    end
  end

  def game_over?
    human.score >= 5 || player.score >= 5
  end

  def exit_game
    display_goodbye_message
    exit
  end
end

Game.new.play
