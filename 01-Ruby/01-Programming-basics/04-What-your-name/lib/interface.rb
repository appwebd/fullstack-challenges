require_relative "compute_name"

def ask_and_get(param)
  puts "Please enter your #{param}"
  gets.chomp
end

def name_from_terminal
  first_name = ask_and_get("first name")
  second_name = ask_and_get("middle name")
  last_name = ask_and_get("last name")

  compute_name(first_name, second_name, last_name)
end

puts "Hello #{name_from_terminal}!"
