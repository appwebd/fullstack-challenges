# @param students Array of students
# @return array
def wagon_sort(students)
  students.sort_by! { |word| word.downcase }
end
