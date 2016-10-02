words = ['laboratory',
         'experiment',
         'Pans Labyrinth',
         'elaborate',
         'polar bear']

words.each do |word|
  puts word if word =~ /lab/
end
