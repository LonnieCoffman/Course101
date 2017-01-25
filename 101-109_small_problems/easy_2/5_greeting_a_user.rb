# initial solution
def holla_back(name)
  return puts "hello #{name}. why are we screaming?".upcase if name.end_with?('!')
  puts "hello #{name}."
end

print 'What is your name? '
holla_back(gets.chomp)
