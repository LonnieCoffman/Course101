# Question 1
# I expect an error to occur since every object except nil and false evaluate to
# true. Thus the value of greeting never gets set.
# partially correct, except I did not realize that greeting would be set to nil

# Question 2
# puts greetings should display {:a=>"hi"} since informal_greetings is a new
# string object created from a value within the greetings array, so it does not
# modify the original array
# 100% incorrect!  Very difficult concept to grasp.

# Question 3
# A) one is: one
#    two is: two
#    three is: three
#
# B) one is: one
#    two is: two
#    three is: three
#
# C) one is: two
#    two is: three
#    three is: one

# Question 4
require 'securerandom'

def generate_uuid
  uuid = [4, 2, 2, 2, 6].map { |num| SecureRandom.hex(num) }
  uuid.join('-')
end

puts generate_uuid

# or
def generate_uuid2
  uuid = ''
  [8, 4, 4, 4, 12].map do |num|
    num.times { uuid << rand(16).to_s(16) }
    uuid << '-'
  end
  uuid.chop
end

puts generate_uuid2

# Question 5
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split('.')
  return false if dot_separated_words.size != 4
  while dot_separated_words.size > 0
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  true
end
