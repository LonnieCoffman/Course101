def print_in_box(str)
  len = str.length + 2
  puts "+#{'-' * len}+"
  puts "|#{' ' * len}|"
  puts "| #{str} |"
  puts "|#{' ' * len}|"
  puts "+#{'-' * len}+"
end

print_in_box('To boldly go where no one has gone before.')
