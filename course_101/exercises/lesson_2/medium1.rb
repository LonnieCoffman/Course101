# Question 1 - Let's do some "ASCII Art" (a stone-age form of nerd artwork from
# back in the days before computers had video screens).
#
# For this exercise, write a one-line program that creates the following output
# 10 times, with the subsequent line indented 1 space to the right:
10.times { |number| puts "#{(' ' * number)}The Flintstones Rock!" }

# Question 2 - Create a hash that expresses the frequency with which each letter
# occurs in this string:
statement = 'The Flintstones Rock'

result = {}
statement.split('').each do |letter|
  next if letter == ' '
  result[letter] = result.key?(letter) ? result[letter] += 1 : 1
end
p result

# Question 3 -
