require_relative 'app/repositories/employee_repository'

class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    puts '-- Food Delivery --'

    while @running
      current_user_actions
      print `clear`
    end
  end

  private

  def current_user_actions
    @current_user = @sessions_controller.login
    while @current_user
      if @current_user.manager?
        route_manager_action
      else
        route_rider_action
      end
    end
  end

  def route_manager_action
    print_manager_menu
    choice = gets.chomp.to_i
    print `clear`
    manager_action(choice)
  end

  def route_rider_action
    print_rider_menu
    choice = gets.chomp.to_i
    print `clear`
    rider_action(choice)
  end

  def print_manager_menu
    puts '------- MENU -------'
    puts '1. Add new meal'
    puts '2. List all meals'
    puts '3. Add new customer'
    puts '4. List all customers'
    puts '5. Add new order'
    puts '6. List all undelivered orders'
    puts '7. Logout'
    puts '8. Exit'
    print '> '
  end

  def print_rider_menu
    puts '--------------------'
    puts '------- MENU -------'
    puts '--------------------'
    puts '1. List my undelivered orders'
    puts '2. Mark order as delivered'
    puts '3. Logout'
    puts '4. Exit'
    print '> '
  end

  def manager_action(choice)
    case choice
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @orders_controller.add
    when 6 then @orders_controller.list_undelivered_orders
    when 7 then logout!
    when 8 then stop!
    else puts 'Try again...'
    end
  end

  def rider_action(choice)
    case choice
    when 1 then @orders_controller.list_my_orders(@current_user)
    when 2 then @orders_controller.mark_as_delivered(@current_user)
    when 3 then logout!
    when 4 then stop!
    else puts 'Try again...'
    end
  end

  def logout!
    @current_user = nil
  end

  def stop!
    logout!
    @running = false
  end
end
