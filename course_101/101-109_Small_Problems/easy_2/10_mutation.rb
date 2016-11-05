array1 = %w(Moe Larry Curly Chemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C') }
puts array2

# on line 3 array1 is assigned all of the elements of array2
# on line 4 all of the elements in array1 that start with C are changed to uppercase
# line 5 should print since the values in array2 are references to the values in array1
# Moe
# Larry
# CURLY
# CHEMP
# Harpo
# CHICO
# Groucho
# Zeppo
