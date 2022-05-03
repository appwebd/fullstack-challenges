require_relative '../views/meals_view'
require_relative '../repositories/meal_repository'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def add
    name = @view.ask_for_string('What is the name?')
    price = @view.ask_for_integer('what is the price?')

    meal = Meal.new(name: name, price: price)
    @meal_repository.create(meal)
    @view.confirm(meal)
  end

  def list
    @view.display(@meal_repository.all)
  end
end
