family = { sister: 'Sonya',
           mother: 'Barbara',
           father: 'Ken',
           wife: 'Sharron' }
people = { boss: 'Jordan',
           friend: 'Noto',
           mailman: 'Bob' }

# merge
new_hash = family.merge(people)
puts 'Merge using merge'
p new_hash
p family

# merge!
new_hash = family.merge!(people)
puts 'Merge using merge!'
p new_hash
p family
