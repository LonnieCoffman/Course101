words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
         'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
         'flow', 'neon']

sorted_words = {}

words.each do |word|
  key = word.chars.sort.join
  if sorted_words.key?(key)
    sorted_words[key].push(word)
  else
    sorted_words[key] = [word]
  end
end

sorted_words.each do |k, v|
  p v
end
