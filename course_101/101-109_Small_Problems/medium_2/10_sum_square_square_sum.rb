def sum_square_difference(num)
  sum_square = 0
  square_sum = 0
  (1..num).each do |n|
    sum_square += n
    square_sum += n**2
  end
  sum_square**2 - square_sum
end

puts sum_square_difference(3) == 22
# -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150
