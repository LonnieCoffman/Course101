# initial solution
def years_til_retirement(current_age, retirement_age)
  retire_years = retirement_age - current_age
  puts "It's #{Time.now.year}. You will retire in #{Time.now.year + retire_years}."
  puts "You have only #{retire_years} years of work to go!"
end

print 'What is your age? '
current_age = gets.chomp.to_i
print 'At what age would you like to retire? '
retirement_age = gets.chomp.to_i

years_til_retirement(current_age, retirement_age)
