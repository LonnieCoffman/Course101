def substrings_at_start(str)
  arr = str.chars
  arr.each_index.map { |idx| arr[0..idx].join }
end

def substrings(str)
  arr = str.chars
  arr.each_index.map do |idx|
    substrings_at_start(arr[idx..arr.size - 1].join)
  end.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
