# Return an array of two arrays, the first containing words of length `size`, the second containing
# all the other words.  In addition to this split, each array should be *sorted*.
def size_splitter(array, size)
  first = array.select { |element| element.length == size }
  second = array.reject { |element| element.length == size }
  [first.sort, second.sort]
end

# Return an array of two arrays, the first containing elements for which the given block yields true,
# the second containing all the other elements. No sort needed this time.
def block_splitter(array)
  first = array.select { |item| yield(item) }
  second = array.reject { |item| yield(item) }
  [first.sort, second.sort]
end
