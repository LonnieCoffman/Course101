def greeting(name)
  "Hello #{name}"
end

puts 'Enter your name: '
name = gets.chomp

puts greeting(name)
