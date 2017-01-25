def balanced?(str)
  count = 0
  str.chars do |char|
    return false if count < 0
    count += 1 if char == '('
    count -= 1 if char == ')'
  end
  count.zero?
end

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false
