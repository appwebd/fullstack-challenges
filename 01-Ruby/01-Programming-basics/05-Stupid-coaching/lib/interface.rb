require_relative "coach_answer"

puts "Hello, I am your coach, what did you want to tell me?"

answer = nil

while answer != ""
  print "> "
  message = gets.chomp
  answer = coach_answer_enhanced(message)
  puts answer
end

puts "Great, see ya!"
