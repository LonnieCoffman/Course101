# initial solution
def reverse_sentence(sentence)
  sentence.split(' ').reverse.join(' ')
end

# modified solution after reading discussion
def reverse_sentence_1(sentence)
  sentence.split.reverse.join(' ')
end

p reverse_sentence_1 'Hello World'

# test cases should all print true
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
