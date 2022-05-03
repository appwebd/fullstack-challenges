def shuffle(array)
  old = array.dup
  randomized = []

  until old.empty?
    n = rand(old.length)
    randomized << old[n]
    old.delete_at(n)
  end
  randomized
end
