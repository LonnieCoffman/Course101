def fibonacci(num)
  return 1 if num <= 2
  fibonacci(num - 1) + fibonacci(num - 2)
end

puts fibonacci(1) #== 1
puts fibonacci(2) #== 1
puts fibonacci(3) #== 2
puts fibonacci(4) #== 3
puts fibonacci(5) #== 5
puts fibonacci(12) #== 144
puts fibonacci(20) #== 6765
