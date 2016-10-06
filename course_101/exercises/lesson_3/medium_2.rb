# Question 1
munsters = {
  'Herman' => { 'age' => 32, 'gender' => 'male' },
  'Lily' => { 'age' => 30, 'gender' => 'female' },
  'Grandpa' => { 'age' => 402, 'gender' => 'male' },
  'Eddie' => { 'age' => 10, 'gender' => 'male' }
}

total_age = 0
munsters.each do |_, details|
  total_age += details['age'] if details['gender'] == 'male'
end
puts total_age

# Question 2
munsters = {
  'Herman' => { 'age' => 32, 'gender' => 'male' },
  'Lily' => { 'age' => 30, 'gender' => 'female' },
  'Grandpa' => { 'age' => 402, 'gender' => 'male' },
  'Eddie' => { 'age' => 10, 'gender' => 'male' },
  'Marilyn' => { 'age' => 23, 'gender' => 'female' }
}

munsters.each do |name, details|
  puts "#{name} is a #{details['age']} year old #{details['gender']}"
end

# Question 3 - did not get this right away need to study this.
def tricky_method(a_string_param, an_array_param)
  a_string_param += 'rutabaga'
  an_array_param << 'rutabaga'

  return a_string_param, an_array_param
end

my_string = 'pumpkins'
my_array = ['pumpkins']
my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


# Question 4
sentence = "Humpty Dumpty sat on a wall."
words = sentence.split(/\W/)
words.reverse!
reverse_sentence = words.join(' ') + '.'
puts reverse_sentence

# Question 5
# The answer is 34

# Question 6
# Nothing was changed. Wrong.

# Question 7
# Rock. Wrong

# Question 8
# No
