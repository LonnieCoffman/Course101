person = { name: 'Joe',
           age: 27,
           sex: 'male',
           hair_color: 'brown',
           height: '5\'9"' }

puts person.value?('male') ? 'has value' : 'does not have value'
