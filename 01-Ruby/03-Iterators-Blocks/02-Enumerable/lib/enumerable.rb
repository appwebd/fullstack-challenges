# computes the sum of elements at odd indexes (1, 3, 5, 7, etc.) You should use Enumerable#each_with_index
def sum_odd_indexed(array)
  result = 0
  array.each_with_index { |item, index| result += item if index.odd? }
  result
end

# another solution of even_numbers array.select { |element| element.even? }
# Return the even numbers from a list of integers. You should use Enumerable#select
def even_numbers(array)

  result = []
  array.select do |num|
    result << num if num.even?
  end

  result
end

# Take an array of words, return the array of words not exceeding max_length characters
# You should use Enumerable#reject
def short_words(array, max_length)

  array.reject { |item| item.length > max_length }
end

# Return the first number from an array that is less than limit. You should use Enumerable#find
def first_under(array, limit)
  array.find { |item| item < limit }
end

# Another solution is return array.map do |string| string.concat("!") end
# Take an array of strings and return a new array with "!" appended to each string.
# You should use Enumerable#map
def add_bang(array)
  array.map { |string| "#{string}!" }
end

# Concatenate all strings given in the array. You should use of Enumerable#reduce
def concatenate(array)
  array.reduce { |accumulate, string| accumulate + string }
end

# Reorganize an array into slices of 2 elements, and sort each slice alphabetically.
# You should use of Enumerable#each_slice
def sorted_pairs(array)
  a_result = []
  array.each_slice(2) { |element| a_result.push element.sort }
  a_result
end
