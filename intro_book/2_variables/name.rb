puts 'What is your first name?'
first_name = gets.chomp
# modified for exercise 4
puts "Welcome, #{first_name}. What is your last name?"
last_name = gets.chomp

# Added for exercise 3
10.times do
  puts first_name
end

# Added for exercise 4
puts first_name + ' ' + last_name
