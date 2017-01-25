DIGITS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
           '6' => 6, '7' => 7, '8' => 8, '9' => 9 }.freeze

def string_to_signed_integer(str)
  str[0] == '-' ? posneg = '-' : posneg
  str.delete!('-+')
  puts posneg
  posneg == '-' ? string_to_integer(str) * -1 : string_to_integer(str)
end

def string_to_integer(str)
  nums = str.chars.map { |char| DIGITS[char] }
  value = 0
  nums.each { |digit| value = 10 * value + digit }
  value
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
