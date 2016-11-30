def letter_percentages(str)
  { lowercase: str.count('a-z').to_f / str.length * 100,
    uppercase: str.count('A-Z').to_f / str.length * 100,
    neither: str.count('^a-z', '^A-Z').to_f / str.length * 100 }
end

puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
