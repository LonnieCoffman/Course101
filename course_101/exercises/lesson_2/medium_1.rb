# Question 1

10.times { |number| puts "#{(' ' * number)}The Flintstones Rock!" }

# Question 2

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

# Question 5

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

# Question 6
# Do you like << or + for modifying the buffer?".
# Is there a difference between the two, other than what operator she chose
# to use to add an element to the buffer?
# no. Wrong. The caller is mutated.

# Question 7
limit = 15

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"
# The limit variable is in the wrong scope. It can be fixed by passing it in
# as a parameter to the method

# Question 8

def titleize(string)
  string.split.map(&:capitalize).join(' ')
end

puts titleize('mary had a little lamb')

# Question 9

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, info|
  case info['age']
  when (0..18)
    info['age_group'] = 'kid'
  when (18..65)
    info['age_group'] = 'adult'
  else
    info['age_group'] = 'senior'
  end
end
p munsters
