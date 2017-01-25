def find_fibonacci_index_by_length(idx)
  num = [1, 0]
  counter = 1
  loop do
    counter += 1
    num.unshift(num[0] + num[1]).pop
    break if idx == num[0].to_s.size
  end
  counter
end

puts find_fibonacci_index_by_length(2) == 7
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847
