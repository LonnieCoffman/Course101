def holla_back(name)
  if name.end_with?('!') return puts "hello #{name}. why are we screaming?".upcase
  else puts "hello #{name}." end
end

print 'What is your name? '
holla_back(gets.chomp)
