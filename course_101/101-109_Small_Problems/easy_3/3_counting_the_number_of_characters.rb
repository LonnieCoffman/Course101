def num_chars(string)
  count = string.length - string.count(' ')
  puts "There are #{count} characters in \"#{string}\"."
end

puts 'Please write word or multiple words:'
num_chars(gets.chomp)
