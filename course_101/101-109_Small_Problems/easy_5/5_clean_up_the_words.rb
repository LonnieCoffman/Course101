def cleanup(str)
  p str.gsub(/[^\p{Alnum}]/, ' ').squeeze(' ')
end

puts cleanup("---what's my +*& line?") == ' what s my line '
