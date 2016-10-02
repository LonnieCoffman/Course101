list = %w(dog cat fish turtle bird)

list.each_with_index do |pet, index|
  puts "#{index + 1}. #{pet}"
end
