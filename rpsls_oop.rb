module Displayable
  def display_initial_ui
    clear_screen
    display_header
    puts "You are playing against #{computer.name}."
    puts
  end

  def display_game_start_ui
    display_upper_ui
    puts "The first to #{Game::ROUND_WIN} wins."
    puts 'Make your selection below to begin.'
    display_lower_ui
  end

  def display_move_ui
    display_upper_ui
    puts "You picked: #{human.move}"
    puts puts "Computer Picked: #{computer.move}"
    puts outcome_message
    display_lower_ui
  end

  def display_rules
    clear_screen
    puts <<~RULES
      ===  Game Rules ====
      Each round the player will choose rock, paper, scissors, lizard or
      spock. The computer will then choose from the same.  Both choices
      will be revealed at the same time and the winner will be determined
      by the heirarchy below.  The winner of the round will be awarded
      1 point and the first to #{Game::ROUND_WIN} wins the match.

      RULES
    Game::WINNING_COMBOS.each do |_, row|
      row.each { |rule| puts " #{rule}" }
      puts
    end
    display_go_back
  end

  def display_history
    clear_screen
    puts ' ===  Game History ===='
    puts "  Player  | Computer |  Result  |  Round   |"
    puts " ---------+----------+----------+----------+"
    @history.database.each do |row|
      row.each_with_index { |e| print "  #{e}#{' ' * (8 - e.size)}|" }
      puts
    end
    display_go_back
  end

  def display_go_back
    puts puts ' ==========================================='
    print ' Press ENTER to go back'
    gets
  end

  def display_goodbye_message
    puts
    puts puts 'Thank you for playing. Good bye.'
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

  def outcome_message
    return 'Great Minds Think Alike.....You Tie!' if @outcome == 'tie'
    return get_outcome(human.move, computer.move) if @outcome == 'win'
    get_outcome(computer.move, human.move)
  end

  def get_outcome(first, second)
    Game::WINNING_COMBOS[first.to_sym].each do |rule|
      return "#{rule}!!" if rule.include?(second)
    end
  end

  def clear_screen
    system 'cls' # windows
    system 'clear' # mac / linux
  end

  def display_header
    puts 'Welcome to Rock - Paper - Scissors - Lizard - Spock'
    puts '==================================================='
  end

  def display_divider
    puts '................................................'
  end

  def display_options
    puts '(H)ow to Play ... (M)ove History .. (Q)uit Game'
    puts
  end

  def display_choices
    puts
    puts '(R)Rock .. (P)Paper .. (S)Scissors .. (L)Lizard .. (SS)Spock'
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
      break if n =~ /^[a-z]/i
      puts "Sorry, name must start with a letter."
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

class R2D2 < Player
  def initialize
    @counter = 0
    super
  end

  def set_name
    self.name = 'R2D2'
  end

  def choose(_history)
    # selects moves in order R P S L SS
    self.move = Game::VALID_CHOICES[@counter]
    increment_counter
  end

  private

  def increment_counter
    @counter == Game::VALID_CHOICES.size - 1 ? @counter = 0 : @counter += 1
  end
end

class Hal < Player
  def set_name
    self.name = 'Hal'
  end

  def choose(history)
    # selects same move as player's previous move
    self.move = history.empty? ? Game::VALID_CHOICES.sample : history.last[0]
  end
end

class Chappie < Player
  def set_name
    self.name = 'Chappie'
  end

  def choose(_history)
    # non weighted random
    self.move = Game::VALID_CHOICES.sample
  end
end

class Sonny < Player
  def initialize
    @choices = []
    super
  end

  def set_name
    self.name = 'Sonny'
  end

  def choose(history)
    # selects a move that would have won against players previous move
    return self.move = Game::VALID_CHOICES.sample if history.empty?
    Game::WINNING_COMBOS.each do |rules|
      rules[1].each do |rule|
        @choices << rule.split.first if rule.split.last == history.last[0]
      end
    end
    self.move = @choices.sample
  end
end

class Number5 < Player
  def initialize
    @choices = []
    super
  end

  def set_name
    self.name = 'Number 5'
  end

  def choose(_history)
    # picks rock 37%, paper 22%, scissors 18%, lizard 15%, spock 8%
    @choices << ['rock'] * 37 << ['paper'] * 22 << ['scissors'] * 18
    @choices << ['lizard'] * 15 << ['spock'] * 8
    self.move = @choices.flatten.shuffle.sample
    @choices = []
  end
end

class Score
  def initialize
    reset
  end

  def reset
    @score = 0
  end

  def increment
    @score += 1
  end

  def win?
    @score == Game::ROUND_WIN
  end

  def to_s
    @score.to_s
  end
end

class History
  attr_accessor :database

  def initialize
    @database = []
  end

  def display
    p @database
  end
end

class Game
  include Displayable

  VALID_CHOICES = %w(rock paper scissors lizard spock).freeze

  WINNING_COMBOS = {
    rock: ['rock crushes lizard', 'rock crushes scissors'],
    paper: ['paper disproves spock', 'paper covers rock'],
    scissors: ['scissors cut paper', 'scissors decapitate lizard'],
    spock: ['spock smashes scissors', 'spock vaporizes rock'],
    lizard: ['lizard poisons spock', 'lizard eats paper']
  }.freeze

  ROUND_WIN = 10

  attr_accessor :human, :computer

  def initialize
    @computer = [R2D2, Hal, Chappie, Sonny, Number5].sample.new
    display_initial_ui
    @human = Human.new
    @history = History.new
    @option = nil
    @outcome = nil
    @round = 0
  end

  def play
    loop do
      start_new_game
      loop do
        user_input
        if %w(h m q).include?(@option)
          select_option
        else
          select_moves
          determine_outcome
          record_outcome
        end
        human.move.nil? ? display_game_start_ui : display_move_ui
        (play_again? ? break : exit_game) if game_over?
      end
    end
  end

  private

  def start_new_game
    @round += 1
    human.score.reset
    computer.score.reset
    display_game_start_ui
  end

  def user_input
    input = ''
    loop do
      print 'What is your choice? : '
      input = gets.chomp.downcase
      break if %w(h m q r p s l ss).include? input
      human.move.nil? ? display_game_start_ui : display_move_ui
      print 'That is an invalid choice.  '
    end
    @option = input
  end

  def select_option
    case @option
    when 'h' then display_rules
    when 'm' then display_history
    when 'q' then exit_game
    end
  end

  def select_moves
    human.choose @option
    computer.choose(@history.database)
  end

  def record_outcome
    determine_outcome
    update_score
    append_history
  end

  def determine_outcome
    return @outcome = 'tie' if human.move == computer.move
    WINNING_COMBOS[human.move.to_sym].each do |rule|
      return @outcome = 'win' if rule.include? computer.move
    end
    @outcome = 'lose'
  end

  def append_history
    @history.database << [human.move, computer.move, @outcome, @round.to_s]
  end

  def update_score
    if (@outcome != 'tie') && (%w(r p s l ss).include? @option)
      @outcome == 'win' ? human.score.increment : computer.score.increment
    end
  end

  def game_over?
    human.score.win? || computer.score.win?
  end

  def play_again?
    answer = nil
    loop do
      if answer.nil?
        print 'Would you like to play again? (y/n) : '
      else
        print "That is an invalid choice.  Must be 'y' or 'n' :"
      end
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      human.move.nil? ? display_game_start_ui : display_move_ui
    end
    return true if answer == 'y'
    false
  end

  def exit_game
    display_goodbye_message
    exit
  end
end

Game.new.play
