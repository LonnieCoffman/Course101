numbers = []

def get_numbers(numbers)
  nth = %w(1st 2nd 3rd 4th 5th)
  nth.size.times do |n|
    puts "==> Enter the #{nth[n]} number:"
    numbers << gets.chomp.to_i
  end
end

def number_appears?(numbers)
  puts '==> Enter the last number:'
  number = gets.chomp.to_i
  appears = numbers.include?(number) ? 'appears' : 'does not appear'
  puts "The number #{number} #{appears} in #{numbers}."
end

get_numbers(numbers)
number_appears?(numbers)
