a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

b = []

a.each do |value|
  b << value.split(' ')
end

b.flatten!

p b
