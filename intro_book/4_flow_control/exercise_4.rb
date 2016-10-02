def num_size(number)
  return 'The number is less than 0' if number < 0
  return 'The number is greater than 100' if number > 100
  return 'The number is between 0 and 50' if number >= 0 && number <= 50
  'The number is between 51 and 100'
end

def num_size_case(number)
  case
  when number < 0
    return 'The number is less than 0'
  when number > 100
    'The number is greater than 100'
  when number >= 0 && number <= 50
    'The number is between 0 and 50'
  else 'The number is between 51 and 100'
  end
end

puts 'Enter a number between 1 and 100'
number = gets.chomp
puts num_size(number.to_i)
puts num_size_case(number.to_i)
