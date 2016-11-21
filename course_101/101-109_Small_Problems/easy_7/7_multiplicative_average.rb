def show_multiplicative_average1(num_arr)
  ans = num_arr.inject(:*) / num_arr.size.round(3)
  puts "The result is #{format('%.3f', ans)}"
end

def show_multiplicative_average(int_arr)
  average = int_arr.reduce(:*) / int_arr.size.round(3)
  puts format('%0.3f', average)
end

show_multiplicative_average([3, 5])
# The result is 7.500
show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667
