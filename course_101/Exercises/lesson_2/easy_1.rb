# question 1 - What would you expect the code below to print?
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
# I would expect 1 2 3.  Wrong!  1 2 2 3 is returned because uniq creates
# a new array and the original array is not mutated. Using the bang operator
# would cause the result I predicted.

# question 2 - Describe the difference between ! and ? in Ruby.
# ! is the bang operator and causes the method it is being added to
# to mutate the caller.  ? is used for methods that return a boolean value.
#
# what is != and where should you use it?
# != means not equal to and should be used when evaluating a statement to
# determine inequality
!user_name = 'Joe'
puts !user_name

words = %w(one two three three four one)
words.uniq!
p words

a = 1 + 5 == 6 ? 'a is true' : 'a is false'
puts a

def am_i_here?
  conditional = true
  puts 'yes, I am here' if conditional
end
am_i_here?

name = 'bob'
puts !!name

# question 3 - Replace the word "important" with "urgent" in this string:
advice = 'Few things in life are as important as' \
         'house training your pet dinosaur.'
advice.gsub!('important', 'urgent')
puts advice

# question 4 - What do the following method calls do
# (assume we reset numbers to the original array between method calls)?
numbers = [1, 2, 3, 4, 5]
# should delete the value at the 1 position, so the 2 should be removed from
# the array.
numbers.delete_at(1)
# value 1 should be removed from the array
numbers.delete(1)
p numbers

# question 5 - Programmatically determine if 42 lies between 10 and 100.
puts 'true' if (10..100).cover?(42)

# question 6 - show two different ways to
# put the expected "Four score and " in front of it.
famous_words = 'seven years ago...'
puts 'Four score and ' << famous_words
puts "Four score and #{famous_words}"

# question 7 - Fun with gsub:
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
puts eval(how_deep)

# question 8 - Make this into an un-nested array.
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
p flintstones
flintstones.flatten!
p flintstones

# qustion 9 - Turn this into an array containing
# only two elements: Barney's name and Barney's number
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2,
                "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
