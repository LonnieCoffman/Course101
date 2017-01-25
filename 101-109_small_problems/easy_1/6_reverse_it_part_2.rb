# initial solution
def reverse_words(words)
  ordered = []
  words.split.each { |word| ordered << (word.length >= 5 ? word.reverse : word) }
  ordered.join(' ')
end

# modified solution after reading discussion
# kept solution same since length and size appear in the docs to be identical

# test cases
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
