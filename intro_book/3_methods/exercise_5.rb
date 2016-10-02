# the following returns a nil value because puts always returns nil

def scream(words)
  words = words + '!!!!'
  puts words
end

scream('Yippeee')
