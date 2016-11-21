def multiply_list(arr1, arr2)
  arr1.each_with_index.map { |num, idx| num * arr2[idx] }
end

p multiply_list([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]
