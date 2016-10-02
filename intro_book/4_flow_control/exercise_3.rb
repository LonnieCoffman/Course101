def num_size(number)
  return 'The number is less than 0' if number < 0
  return 'The number is greater than 100' if number > 100
  return 'The number is between 0 and 50' if number >= 0 && number <= 50
  'The number is between 51 and 100'
end

puts 'Enter a number between 1 and 100'
number = gets.chomp
puts num_size(number.to_i)
