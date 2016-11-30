BLOCKS = { B: 'O', X: 'K', D: 'Q', C: 'P', N: 'A', G: 'T', R: 'E',
           F: 'S', J: 'W', H: 'U', V: 'I', L: 'Y', Z: 'M' }

def block_word?(word)
  blocks = BLOCKS.clone
  word.upcase.chars { |letter|
    return false if !blocks.key?(letter.to_sym) && !blocks.value?(letter)
    blocks.delete_if {|key, value| (key == letter.to_sym || value == letter) }
  }
  true
end

puts block_word?('BATCH') #== true
puts block_word?('BUTCH') #== false
puts block_word?('jest') #== true
