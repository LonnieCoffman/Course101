# initial solution
SQMETERS_TO_SQFEET = 10.7639

def room_size(length, width)
  meters = (length * width).round(2)
  feet = (length * width * SQMETERS_TO_SQFEET).round(2)
  puts "The area of the room is #{meters} square meters (#{feet} square feet)."
end

puts 'Enter the length of the room in meters:'
length = gets.chomp.to_f
puts 'Enter the width of the room in meters:'
width = gets.chomp.to_f

room_size(length, width)

# solution for further exploration
SQFEET_TO_SQINCHES = 144
SQFEET_TO_SQCENTIMETERS = 929.03

def room_size_1(length, width)
  square_feet = (length * width).round(2)
  # did not use square_feet below to avoid inaccuracies by rounding twice.
  square_inches = (length * width * SQFEET_TO_SQINCHES).round(2)
  square_centimeters = (length * width * SQFEET_TO_SQCENTIMETERS).round(2)
  puts 'The area of the room is: '
  puts "  #{square_feet} square feet "
  puts "  #{square_inches} square inches"
  puts "  #{square_centimeters} square centimeters"
end

room_size_1(10, 7)
