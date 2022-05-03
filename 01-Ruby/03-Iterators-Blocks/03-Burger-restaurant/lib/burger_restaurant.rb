# code the `burger` method
def burger(patty, sauce, topping)
  main = (block_given? ? yield(patty) : patty)
  ["bread", main, sauce, topping, "bread"]
end
