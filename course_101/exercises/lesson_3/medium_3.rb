# Question 3
# 'My string looks like this now: pumpkinsrutabaga'
# my_string should be 'pumpkinsrutabaga' because the original string was passed
# by id into the method and was modified within the method.
# 'My array looks like this now: ['pumpkins', 'rutabaga']'
# same answer as above
# Wrong on first and partially right on second.

# Question 4
# This should return:
# 'My string looks like this now: pumpkinsrutabaga'
# 'My array looks like this now: ['pumpkins']'
# For the string the shovel operator appends to the string reference. For the
# array a new array was created within the scope of the method thus creating an
# new object ID.

# Question 5
def color_valid(color)
  color == 'blue' || color == 'green' ? true : false
end
# works but don't need the ternary operator since the comparison statement
# evaluates to true or false without it. duh.
