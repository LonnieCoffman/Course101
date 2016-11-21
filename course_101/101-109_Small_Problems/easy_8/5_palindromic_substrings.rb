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

def palindromes(str)
  new_arr = []
  arr = substrings(str)
  arr.each { |word| new_arr << word if word == word.reverse && word.size > 1 }
  new_arr
end

p palindromes('abcd') #== []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
