# Question 1 - Show an easier way to write this array:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
fintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

# Question 2 How can we add the family pet "Dino" to our usual array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
p flintstones

# Question 3 - How can we add multiple items to our array? (Dino and Hoppy)
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push('Dino', 'Hoppy')
p flintstones

# Question 4 - Shorten this sentence:
advice = "Few things in life are as important as house training your pet dinosaur."
# preadvice = advice.slice!('Few things in life are as important as ')
preadvice = advice.slice!(0, advice.index('house'))
puts preadvice
puts advice

# Question 5 - Write a one-liner to count the number of lower-case 't' characters in the following string:
statement = "The Flintstones Rock!"
puts statement.count('t')

# Question 6 - Back in the stone age (before CSS) we used spaces to align
# things on the screen. If we had a 40 character wide table of Flintstone
# family members, how could we easily center that title above the table with spaces?
title = "Flintstone Family Members"
puts title.center(40)
title.prepend(' '*((40 - title.length) / 2))
puts title
