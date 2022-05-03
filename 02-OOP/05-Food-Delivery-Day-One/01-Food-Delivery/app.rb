require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/customers_controller'
require_relative 'app/controllers/meals_controller'
require_relative 'router'

CSV_FILE_CUSTOMERS = File.join(__dir__, './data/customers.csv')
CSV_FILE_MEALS = File.join(__dir__, './data/meals.csv')

customers = CustomerRepository.new(CSV_FILE_CUSTOMERS)
meals = MealRepository.new(CSV_FILE_MEALS)

customers_controller = CustomersController.new(customers)
meals_controller = MealsController.new(meals)

controllers = { CustomersController: customers_controller, MealController: meals_controller }

router = Router.new(controllers)

# Start the app
router.run
