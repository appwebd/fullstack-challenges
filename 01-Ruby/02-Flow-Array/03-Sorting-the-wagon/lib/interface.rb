require_relative "wagon_sort"

students = []
puts("Type a student name:")
name = gets.chomp
students << name

while name.downcase != ""
  puts "Type another student name or press enter to finish:"
  name = gets.chomp
  students << name if name.downcase != ""
end

students = wagon_sort(students)

last_student = students.pop
list_student = students.join(", ")
if students.count + 1 == 1
  puts "#{students.count + 1} student:"
else
  puts "Congratulations! Your Wagon has #{students.count + 1} students:"
end

if students.count + 1 == 1
  puts last_student
else
  puts "#{list_student} and #{last_student}"
end
