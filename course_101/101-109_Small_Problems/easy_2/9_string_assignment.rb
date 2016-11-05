name = 'Bob'         # name = 'Bob'
save_name = name     # name = 'Bob'  'save_name = 'Bob'
name.upcase!         # name = 'BOB'  'save_name = 'BOB' because save name is a pointer to name
puts name, save_name # 'BOB BOB' on new lines
