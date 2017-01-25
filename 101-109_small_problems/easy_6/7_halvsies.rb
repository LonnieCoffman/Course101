def halvsies(arr)
  size = (arr.size.to_f / 2).ceil
  new_arr = size > 0 ? arr.each_slice(size).to_a : [[]]
  new_arr[1].nil? ? new_arr << [] : new_arr
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]
