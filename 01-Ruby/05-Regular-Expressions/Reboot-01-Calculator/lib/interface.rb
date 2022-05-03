require_relative "calculator"

loop do
  puts "Enter a first number:"
  first_number = gets.chomp.to_i
  puts "Enter a second one:"
  second_number = gets.chomp.to_i
  puts "Which operation [+][-][x][/]"
  operator = gets.chomp
  result = calculate(first_number, second_number, operator)
  puts "Result: #{result}\nDo you want to calculate again? [Y/N]"
  continue = gets.chomp
  break unless continue == /Y|y|S|s/
end
