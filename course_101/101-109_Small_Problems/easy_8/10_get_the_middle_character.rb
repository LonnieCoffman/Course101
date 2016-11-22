def center_of(str)
  half = str.size / 2
  (str.size % 2).zero? ? str[half - 1..half] : str[half]
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'
