DIGITS = %w(0 1 2 3 4 5 6 7 8 9).freeze

def signed_integer_to_string(int)
  return integer_to_string(int) if int.zero?
  int < 0 ? "-#{integer_to_string(-int)}" : "+#{integer_to_string(int)}"
end

def integer_to_string(int)
  str = ''
  loop do
    str << DIGITS[int % 10]
    int /= 10
    break if int <= 0
  end
  str.reverse
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
