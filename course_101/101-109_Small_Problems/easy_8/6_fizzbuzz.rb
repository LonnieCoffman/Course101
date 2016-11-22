def fizzbuzz(from, to)
  (from..to).map do |num|
    val = ''
    val << 'Fizz' if (num % 3).zero?
    val << 'Buzz' if (num % 5).zero?
    val = num if !(num % 3).zero? && !(num % 5).zero?
    val
  end.join(', ')
end

puts fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
