def float?(string)
  string.to_f.to_s == string
end

def int?(string)
  string.to_i.to_s == string
end

def valid_apr?(string)
  int?(strip_symbols(string)) || float?(strip_symbols(string))
end

def strip_symbols(string)
  ['%', ',', '$'].each do |symbol|
    string.delete! symbol if string.include? symbol
  end
  string
end

def clean_apr(string)
  if string.include? '%' # convert a percentage
    strip_symbols(string)
    string = string.to_f * 0.01
  elsif string.to_f >= 0.1
    string.to_f * 0.01
  else
    string.to_f
  end
end

# get loan amount. verify that the amount given is either an integer or float
# if a dollar symbol or comma is in amount remove prior to validaing
puts 'What is the amount of your loan?'
loan_amount = ''
loop do
  loan_amount = gets.chomp
  loan_amount.chomp! '0' if loan_amount.include? '.00'
  loan_amount = strip_symbols(loan_amount)
  if int?(loan_amount) || float?(loan_amount)
    loan_amount = loan_amount.to_f
    break if loan_amount > 0
  end
  puts 'Loan amount appears invalid.  Please enter loan amount:'
end

# get APR.  allow to be entered as a % or integer or float. convert all to float
# if starts with a decimal prepend 0
puts 'What is your Annual Percentage Rate (APR)?'
annual_percentage_rate = ''
loop do
  annual_percentage_rate = gets.chomp
  annual_percentage_rate.prepend '0' if annual_percentage_rate.start_with?('.')
  if valid_apr?(annual_percentage_rate)
    annual_percentage_rate = clean_apr(annual_percentage_rate)
    break if annual_percentage_rate >= 0
  end
  puts 'Annual Percentage Rate appears invalid. ' \
         'Please enter Annual Percentage Rate:'
end

# get loan duration in months.  Only allow positive integers.
puts 'What is the duration of your loan in months?'
loan_duration = ''
loop do
  loan_duration = gets.chomp
  if loan_duration.to_i.to_s == loan_duration
    loan_duration = loan_duration.to_i
    break if loan_duration > 0
  end
  puts 'Loan duration appears invalid. Please enter loan duration:'
end

monthly_interest_rate = annual_percentage_rate / 12

# modified formula for 0% interest Rate
if annual_percentage_rate.zero?
  monthly_payment = loan_amount / loan_duration
else
  monthly_payment = loan_amount *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**-loan_duration))
end

puts "A loan amount of $#{format('%.2f', loan_amount)} with an APR of " \
     "#{(annual_percentage_rate * 100).round(2)}% for #{loan_duration} " \
     "months will require a payment of $#{format('%.2f', monthly_payment)}"
