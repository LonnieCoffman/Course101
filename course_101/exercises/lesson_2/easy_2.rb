# question 1 - In this hash of people and their age,see if "Spot" is present.
# Bonus: What are two other hash methods that would work just as well for this
# solution?
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
puts ages.has_key? 'Spot'
puts ages.key? 'Spot'
puts ages.fetch('Spot', false)

puts ages.include? 'Spot'
puts ages.member? 'Spot'

# Question 2 - Add up all of the ages from our current Munster family hash:
ages = { "Herman" => 32,
         "Lily" => 30,
         "Grandpa" => 5843,
         "Eddie" => 10,
         "Marilyn" => 22,
         "Spot" => 237 }
total_ages = 0
ages.each { |_, age| total_ages += age }
puts total_ages

puts ages.values.inject(:+)

# Question 3 - throw out the really old people (age 100 or older).
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.each { |name, age| ages.delete name if age >= 100 }
p ages

# delete_if or keep_if are better solutions
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.keep_if { |_, age| age < 100 }
p ages

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.delete_if { |_, age| age >= 100 }
p ages

# question 4 - Convert the string in the following ways
# (code will be executed on original munsters_description below):
munsters_description = "The Munsters are creepy in a good way."

# "The munsters are creepy in a good way."
puts munsters_description.capitalize!

# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
puts munsters_description.swapcase!

# "the munsters are creepy in a good way."
puts munsters_description.downcase!

# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
puts munsters_description.upcase!

# question 5 - We have most of the Munster family in our age hash: add ages for Marilyn
# and Spot to the existing hash
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge! additional_ages
puts ages

# question 6 - Pick out the minimum age from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
puts ages.values.min

# question 7 - See if the name "Dino" appears in the string below:
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.include? 'Dino'

# question 8 - Find the index of the first name that starts with "Be"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.each_with_index { |name, index| puts index if name.start_with? 'Be' }

# question 9 - Using array#map!, shorten each of these names to just 3 characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |name| name[0, 3] }
p flintstones

# question 10
# Again, shorten each of these names to just 3 characters -- but this time do it all on one line:
# see above
