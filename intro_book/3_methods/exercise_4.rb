# this will print nothing because the return is invoked prior to
# the puts words command

def scream(words)
  words = words + '!!!!'
  return
  puts words
end

scream('Yippeee')
