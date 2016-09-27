# get loan amount. verify that the amount given is either an integer or float
# if a dollar symbol or comma is in amount remove prior to validaing
puts 'What is the amount of your loan?'
loan_amount = ''
loop do
  loan_amount = gets.chomp
  loan_amount.delete! '$,'
  if loan_amount.to_i.to_s == loan_amount ||
     loan_amount.to_f.to_s == loan_amount
    loan_amount = loan_amount.to_f
    break
  else
    puts 'Loan amount appears invalid.  Please enter loan amount:'
  end
end

# get APR.  allow to be entered as a % or integer or float. convert all to float
# if starts with a decimal prepend 0
puts 'What is your Annual Percentage Rate (APR)?'
annual_percentage_rate = ''
loop do
  annual_percentage_rate = gets.chomp
  annual_percentage_rate.delete! '%'
  annual_percentage_rate.prepend '0' if annual_percentage_rate.start_with?('.')
  if annual_percentage_rate.to_i.to_s == annual_percentage_rate ||
     annual_percentage_rate.to_f.to_s == annual_percentage_rate
    annual_percentage_rate = annual_percentage_rate.to_f
    annual_percentage_rate *= 0.01 if annual_percentage_rate > 1
    break
  else
    puts 'Annual Percentage Rate appears invalid. ' \
         'Please enter Annual Percentage Rate:'
  end
  break
end

# get loan duration in months.  Only allow positive integers.
puts 'What is the duration of your loan in months?'
loan_duration = ''
loop do
  loan_duration = gets.chomp
  if loan_duration.to_i.to_s == loan_duration
    loan_duration = loan_duration.to_i
    break
  else
    puts 'Loan duration appears invalid. Please enter loan duration:'
  end
end

monthly_interest_rate = annual_percentage_rate / 12

monthly_payment = loan_amount *
                  (monthly_interest_rate /
                  (1 - (1 + monthly_interest_rate)**-loan_duration))

puts "A loan amount of $#{format('%.2f', loan_amount)} with an APR of " \
     "#{annual_percentage_rate * 100}% for #{loan_duration} months will " \
     "require a payment of $#{monthly_payment.round(2)}"
