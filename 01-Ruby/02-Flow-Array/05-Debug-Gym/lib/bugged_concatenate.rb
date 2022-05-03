def bugged_concatenate(array)
  concatenated_string = ""
  array.each do |element|
    concatenated_string = concatenated_string + element.to_s
  end
  concatenated_string.upcase
end

def build_1984_title
  bugged_concatenate([1, "9", 84, " ", "George Orwell"])
end
