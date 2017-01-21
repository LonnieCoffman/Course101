# Also practiced program in IRB

d = Dir.new('.')

while file = d.read
  puts "#{file} has extension .txt" if File.extname(file) == '.txt'
end

# same thing using the pathname class

require 'pathname'

pn = Pathname.new('.')
pn.entries.each { |f| puts "#{f} has extension .txt" if f.extname == '.txt' }
