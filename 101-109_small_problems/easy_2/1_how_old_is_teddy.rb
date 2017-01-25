# initial solution
puts "Teddy is #{rand(20..200)} years old!"

# modified solution after reading discussion
def print_age(name)
  puts "#{name == '' ? 'Teddy' : name} is #{rand(20..200)} years old!"
end

puts '=> Enter a name: '
print_age(gets.chomp)
