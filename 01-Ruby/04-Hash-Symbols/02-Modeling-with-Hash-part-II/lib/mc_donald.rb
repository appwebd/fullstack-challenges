DISHES_CALORIES = {
  "Hamburger" => 250,
  "Cheese Burger" => 300,
  "Big Mac" => 540,
  "McChicken" => 350,
  "French Fries" => 230,
  "Salad" => 15,
  "Coca Cola" => 150,
  "Sprite" => 150
}

MEAL = {
  "Happy Meal" =>	["Cheese Burger", "French Fries", "Coca Cola"],
  "Best Of Big Mac" => ["Big Mac", "French Fries", "Coca Cola"],
  "Best Of McChicken" => %w[McChicken Salad Sprite]
}

def poor_calories_counter(burger, side, beverage)
  DISHES_CALORIES[burger] + DISHES_CALORIES[side] + DISHES_CALORIES[beverage]
end

# Purpose: return number of calories for a less constrained order
#
def calories_counter(orders)
  calories = 0
  orders.each do |key|
    if MEAL.key?(key)
      a_items = MEAL[key]
      calories += poor_calories_counter(a_items[0], a_items[1], a_items[2])
    elsif DISHES_CALORIES.key?(key)
      calories += DISHES_CALORIES[key]
    end
  end
  return calories
end

# orders = ["French Fries", "Happy Meal", "Sprite", "Best Of McChicken"]
# calories_counter(orders)
