require_relative 'app/controllers/customers_controller'
require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/orders_controller'
require_relative 'app/controllers/sessions_controller'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/employee_repository'
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/order_repository'
require_relative 'router'

CSV_FILE_CUSTOMERS = File.join(__dir__, './data/customers.csv')
CSV_FILE_EMPLOYEES = File.join(__dir__, './data/employees.csv')
CSV_FILE_MEALS = File.join(__dir__, './data/meals.csv')
CSV_FILE_ORDERS = File.join(__dir__, './data/orders.csv')


customer_repository = CustomerRepository.new(CSV_FILE_CUSTOMERS)
employee_repository = EmployeeRepository.new(CSV_FILE_EMPLOYEES)
meal_repository = MealRepository.new(CSV_FILE_MEALS)
order_repository = OrderRepository.new(CSV_FILE_ORDERS, meal_repository, customer_repository, employee_repository)


customers_controller = CustomersController.new(customer_repository)
sessions_controller = SessionsController.new(employee_repository)
meals_controller = MealsController.new(meal_repository)
orders_controller = OrdersController.new(meal_repository, customer_repository, employee_repository, order_repository)

router = Router.new(meals_controller, customers_controller, sessions_controller, orders_controller)

# Start the app
router.run
