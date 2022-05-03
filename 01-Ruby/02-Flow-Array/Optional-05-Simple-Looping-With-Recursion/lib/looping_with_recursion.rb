# The trick is to see that:
# 1 + 2 + 3 + 4 + 5 = 1 + (2 + 3 + 4 + 5) = 1 + (2 + [3 + 4 + 5])
def sum_recursive(min, max)
  return -1 if min > max

  if min == max
    max
  else
    min + sum_recursive(min + 1, max)
  end
end
