def substrings_at_start(str)
  arr = str.chars
  arr.each_index.map { |idx| arr[0..idx].join }
end

p substrings_at_start('abc') #== ['a', 'ab', 'abc']
p substrings_at_start('a') #== ['a']
p substrings_at_start('xyzzy') #== ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
