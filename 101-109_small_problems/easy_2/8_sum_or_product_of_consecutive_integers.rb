# initial solution
def sum(num)
  puts "The sum of the integers between 1 and #{num} " \
       "is #{(1..num).inject(:+)}."
end

def product(num)
  puts "The product of the integers between 1 and #{num} " \
       "is #{(1..num).inject(:*)}."
end

# initialize the variables so they are available to the loops below
operation = nil
num = nil

# loop until a valid number is entered
loop do
  puts '=> Please enter a number greater than 0:'
  num = gets.chomp
  break if num.to_i.to_s == num && num.to_i > 0
  puts '=> Error: you did not enter an integer greater than 0. Try again.'
end

num = num.to_i

# loop until a valid operation is entered
loop do
  puts "=> Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp
  break if operation == 's' || operation == 'p'
  puts '=> Error: you did not choose a valid option. Try again.'
end

operation == 's' ? sum(num) : product(num)
