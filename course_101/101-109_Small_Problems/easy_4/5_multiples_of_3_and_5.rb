def multisum(num)
  sum = 0
  (1..num).each { |n| sum += n if (n % 3).zero? || (n % 5).zero? }
  sum
end

# same result using inject method
def multisum(num)
  (0..num).inject { |sum, n| ((n % 3).zero? || (n % 5).zero?) ? sum + n : sum }
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
