require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

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

def strategy(brd, marker)
  square = 0
  WINNING_LINES.each do |line|
    next if brd.values_at(*line).count(marker) != 2
    square = line.select { |val| empty_squares(brd).include?(val) }.join.to_i
  end
  square
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

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end
loop do
  player_score = 0
  computer_score = 0
  loop do
    loop do
      display_score(player_score, computer_score)
      board = initialize_board

      loop do
        display_board(board)
        display_score(player_score, computer_score)

        player_places_piece!(board)
        break if someone_won?(board) || board_full?(board)

        computer_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
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

      break if player_score >= 5 || computer_score >= 5
      prompt "Press ENTER to continue"
      break if gets
    end
    break if player_score >= 5 || computer_score >= 5
  end

  print player_score > computer_score ? "You Won" : "The Computer Won"
  puts ' the best out of 5!'
  puts
  puts "game over!"
  puts
  prompt "Do you want to play again? (Y or N)"
  break if gets.chomp.downcase.start_with?('n')
end
prompt "Thanks for playing!"
