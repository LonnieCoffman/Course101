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

# Question 3 - The result of the following statement will be an error:
# puts "the value of 40 + 2 is " + (40 + 2)
# causes an error because we are displaying without first converting to a string
puts "the value of 40 + 2 is #{(40 + 2)}"
puts "the value of 40 + 2 is " + (40 + 2).to_s

# What happens when we modify an array while we are iterating over it? What
# would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
# This should display each element of the array and then remove it from the
# array.  At the end the array should be empty. Wrong.
# On the first iteration of the array the element at position 0 is displayed
# and then the first element is removed.  On the next iteration the element at
# position 1 is displayed.  Because of the previous shift that element is now 3.

# What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
puts
# On the first iteration the element in position 0 is displayed which is 1. then
# one element is popped off the end of the array.  On the next iteration the
# element at position 1 is displayed which is 2.  Then one element is popped of
# the end of the array.  Because there are no more elements in the array the loop
# ends.  The numbers array would currently return [1, 2].

# Question 5 - Alan wrote the following method, which was intended to show all
# of the factors of the input number.  Alyssa noticed that this will fail if the
# input is 0, or a negative number, and asked Alan to change the loop. How can
# you change the loop construct (instead of using begin/end/until) to make
# this work? Note that we're not looking to find the factors for 0 or negative
# numbers, but we just want to handle it gracefully instead of raising an
# exception or going into an infinite loop.
def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

puts factors(10)
# Bonus 1 - What is the purpose of the number % dividend == 0 ?
# It is using the modulus to determine if dividing number by dividend does not
# leave a remainder.

# Bonus 2 - What is the purpose of the second-to-last line in the method
# (the divisors before the method's end)?
# since this is the last line evalutated it is returned.  So, no matter what
# happens in the method, provided there are no errors the divisors array is
# returned.
