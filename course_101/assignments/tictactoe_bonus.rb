require 'pry'

FIRST_MOVE = 'choose'.freeze # player, computer or choose
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
NUM_GAMES = 5

def prompt(message)
  puts "=>#{message}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  system 'cls'
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end
# rubocop: enable Metrics/AbcSize

def display_score(player_score, computer_score)
  puts
  puts "Player Score: #{player_score} | Computer Score: #{computer_score}"
  puts
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(brd, delimiter = ',', connector = 'or')
  choices = empty_squares(brd)
  return choices.join if choices.size <= 1
  ending = " #{connector} #{choices.pop}"
  choices.join(delimiter + ' ') + ending
end

def place_piece!(brd, current_player)
  player_places_piece!(brd) if current_player == 'player'
  computer_places_piece!(brd) if current_player == 'computer'
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(brd)}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  offense = strategy(brd, COMPUTER_MARKER)
  defense = strategy(brd, PLAYER_MARKER)
  if offense > 0
    brd[offense] = COMPUTER_MARKER
  elsif defense > 0
    brd[defense] = COMPUTER_MARKER
  elsif brd[5] == INITIAL_MARKER
    brd[5] = COMPUTER_MARKER
  else
    brd[empty_squares(brd).sample] = COMPUTER_MARKER
  end
end

def strategy(brd, marker)
  square = 0
  WINNING_LINES.each do |line|
    next if brd.values_at(*line).count(marker) != 2
    square = line.select { |val| empty_squares(brd).include?(val) }.join.to_i
    break if square > 0
  end
  square
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    return 'Player' if brd.values_at(*line).count(PLAYER_MARKER) == 3
    return 'Computer' if brd.values_at(*line).count(COMPUTER_MARKER) == 3
  end
  nil
end

loop do
  player_score = 0
  computer_score = 0
  first = FIRST_MOVE
  loop do
    loop do
      board = initialize_board
      display_board(board)
      display_score(player_score, computer_score)

      if first == 'choose'
        loop do
          puts 'Who goes first? (player or computer)'
          first = gets.chomp.downcase
          break if first == 'player' || first == 'computer'
        end
      end

      current_player = first

      loop do
        display_board(board)
        display_score(player_score, computer_score)

        place_piece!(board, current_player)
        break if someone_won?(board) || board_full?(board)

        current_player = current_player == 'computer' ? 'player' : 'computer'
      end

      display_board(board)

      if someone_won?(board)
        winner = detect_winner(board)
        winner == 'Player' ? player_score += 1 : computer_score += 1
        display_score(player_score, computer_score)
        prompt "#{winner} won this game!"
      else
        display_score(player_score, computer_score)
        prompt "It's a tie!"
      end

      break if player_score >= NUM_GAMES || computer_score >= NUM_GAMES
      prompt 'Press ENTER to continue'
      break if gets
    end
    break if player_score >= NUM_GAMES || computer_score >= NUM_GAMES
  end

  print player_score > computer_score ? 'You Won' : 'The Computer Won'
  puts " the best out of #{NUM_GAMES}!"
  puts
  puts 'game over!'
  puts

  answer = ''
  loop do
    prompt 'Do you want to play again? (Y or N)'
    answer = gets.chomp.downcase
    break if answer == 'n' || answer == 'y'
  end
  break if answer == 'n'
end
prompt 'Thanks for playing!'
