person = { name: 'Joe',
           age: 27,
           sex: 'male',
           hair_color: 'brown',
           height: '5\'9"' }

person.each_key { |k| puts k }
person.each_value { |v| puts v }
person.each { |k, v| puts "#{k}: #{v}" }
