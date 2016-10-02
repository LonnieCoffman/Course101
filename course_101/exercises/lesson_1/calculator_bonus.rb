require 'yaml'
MESSAGES = YAML.load_file('calculator_bonus_config.yml')
LANG = 'es'

def messages(message, lang='en')
  MESSAGES[LANG][lang][message]
end

def prompt(message)
  Kernel.puts("#{MESSAGES[LANG]['prepend']} #{message}")
end

def integer?(num)
  # initially tried to use is_a?(Integer).  Did not work as anticipated.
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def number?(num)
  integer?(num) || float?(num)
end

def valid_number?(num)
  num.to_i().nonzero?
end

def operation_to_message(op)
  operation = case op
              when '1'
                MESSAGES[LANG]['adding']
              when '2'
                MESSAGES[LANG]['subtracting']
              when '3'
                MESSAGES[LANG]['multiplying']
              when '4'
                MESSAGES[LANG]['dividing']
              end
  operation
end

prompt(MESSAGES[LANG]['welcome_prompt'])
name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES[LANG]['name_error'])
  else
    break
  end
end

prompt("#{MESSAGES[LANG]['greeting']} #{name}")

loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES[LANG]['first_number_prompt'])
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt(MESSAGES[LANG]['number_error'])
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES[LANG]['second_number_prompt'])
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt(MESSAGES[LANG]['number_error'])
    end
  end

  prompt(MESSAGES[LANG]['operator_prompt'])

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES[LANG]['operator_error'])
    end
  end

  prompt("#{operation_to_message(operator)} #{MESSAGES[LANG]['working']}")

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("#{MESSAGES[LANG]['result']} #{result}")

  prompt(MESSAGES[LANG]['recalculate'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES[LANG]['goodbye'])
