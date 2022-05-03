# NOTE: Read about BasicObject#object_id
# http://www.ruby-doc.org/core-2.5.3/BasicObject.html#method-i-__id__

# You can try launching `irb` to test some values
# irb> :foo.object_id
# irb> :foo.object_id
# irb> "foo".object_id
# irb> "foo".object_id

# Answer the question by making this method to return true or false
def are_identical_symbols_same_objects?
  true
end

# Answer the question by making this method to return true or false
def are_identical_strings_same_objects?
  false
end


# Remember, RTFM! Your doc is your friend
# - http://www.ruby-doc.org/core-2.5.3/String.html
# - http://www.ruby-doc.org/core-2.5.3/Symbol.html

# Return the symbol version of the parameter `a_string` passed to this method
def convert_string_to_symbol(a_string)
  a_string.to_sym
end

# Return the string version of the parameter `a_symbol` passed to this method
def convert_symbol_to_string(a_symbol)
  a_symbol.to_s
end

# Return a Hash representing yourself, with keys such as age and name
def me
  { age: 20, name: "Jon Doe" }
end

# return an array of fruits
def fruits
  ['Banana', 'Berries', "Meltwater", "Apple", "Ruby bell", "Grapefruit", "Strawberry"]
end
