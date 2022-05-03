def sum_with_for(min, max)
  result = 0
  if min > max
    result = -1
  else
    for i in min..max
      result += i
    end
  end

  result
end

def sum_with_while(min, max)
  result = 0
  if min > max
    result = -1
  else
    while min <= max
      result += min
      min += 1
    end
  end
  result
end

# Another solution
# def sum_with_for(min, max)
#  return -1 if min > max
#  sum = 0
#
#  for i in min..max
#    sum += i
#  end
#
#  return sum
# end

# Another solution
# def sum_with_while(min, max)
#  return -1 if min > max
#  sum = 0
#  i = min
#
#  while i <= max
#    sum += i
#    i += 1
#  end
#
#  return sum
# end
