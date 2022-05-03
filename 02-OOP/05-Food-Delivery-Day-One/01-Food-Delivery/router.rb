class Router
  def initialize(attribute = {})
    @meals_controller = attribute[:MealController]
    @customers_controller = attribute[:CustomersController]
    @running = true
  end

  def run
    puts "-- Food Delivery --"

    while @running
      display_menu
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @customers_controller.list
    when 3 then @meals_controller.add
    when 4 then @customers_controller.add
    when 5 then stop
    else
      puts "Please enter your choice (number range 1-5)"
    end
  end

  def stop
    @running = false
  end

  def display_menu
    puts ""
    puts 'What do you want to do?'
    puts '-' * 23
    puts '1. List all Meals'
    puts '2. List all Customers'
    puts '3. Add a Meal'
    puts '4. Add a Customer'
    puts '5. Exit'
  end
end
