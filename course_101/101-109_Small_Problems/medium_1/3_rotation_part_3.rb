def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(num, digits)
  nums = num.to_s.split('')
  (nums[0..(-digits - 1)] + rotate_array(nums[-digits..-1])).join.to_i
end

def max_rotation(num)
  num.to_s.size.downto(2) do |n|
    num = rotate_rightmost_digits(num, n)
  end
  num
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
