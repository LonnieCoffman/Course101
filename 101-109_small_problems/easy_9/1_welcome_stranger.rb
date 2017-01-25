def greetings(name, data)
  fullname = name.join(' ')
  "Hello, #{fullname}! " \
  "Nice to have a #{data[:title]} #{data[:occupation]} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> Hello, John Q Doe! Nice to have a Master Plumber around.
