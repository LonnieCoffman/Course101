def fibonacci(num)
  nth = [1, 1]
  3.upto(num) { nth[0], nth[1] = nth[1], nth[0] + nth[1] }
  nth[1]
end

puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
puts fibonacci(100_001) # => 4202692702.....8285979669707537501
