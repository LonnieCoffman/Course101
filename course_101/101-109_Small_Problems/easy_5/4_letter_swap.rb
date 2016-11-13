def swap(str)
  str.split.map do |word|
    first, *mid, last = word.chars
    "#{last}#{mid.join}#{first}"
  end.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'
