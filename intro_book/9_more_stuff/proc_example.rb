# proc_example.rb

talk = proc do |name|
  puts "I am talking to #{name}"
end

talk.call 'Bob'
