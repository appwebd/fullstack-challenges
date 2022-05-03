# return number of calories for this mcDonald order
def poor_calories_counter(burger, side, beverage)
  poor_calories_counter = {
    'Hamburger' =>	250, 'Cheese Burger' =>	300, 'Big Mac' =>	540, 'McChicken' =>	350,
    'French Fries' =>	230, 'Salad' =>	15, 'Coca Cola' =>	150, 'Sprite' =>	150
  }
  calories = 0
  calories = poor_calories_counter[burger] if poor_calories_counter.key?(burger)
  calories += poor_calories_counter[side] if poor_calories_counter.key?(side)
  calories += poor_calories_counter[beverage] if poor_calories_counter.key?(beverage)
  calories
end
