def transpose(arr)
  new_arr = [[],[],[]]
  arr.each_with_index do |subarr, idx|
    subarr.each_with_index do |val, subidx|
      new_arr[subidx][idx] = val
    end
  end
  new_arr
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
