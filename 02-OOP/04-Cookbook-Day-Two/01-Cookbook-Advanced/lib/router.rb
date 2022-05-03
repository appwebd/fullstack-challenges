class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    puts "-- My CookBook --"

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
    when 1 then @controller.list
    when 2 then @controller.add
    when 3 then @controller.delete
    when 4 then @controller.import
    when 5 then @controller.mark_as_done
    when 6 then stop
    else
      puts "Please press 1, 2, 3, 4, 5  or 6"
    end
  end

  def stop
    @running = false
  end

  def display_menu
    puts ""
    puts 'What do you want to do?'
    puts '1. List all recipes'
    puts '2. Add a recipe'
    puts '3. Delete a recipe'
    puts '4. Import recipes from the Internet'
    puts '5. Mark as done'
    puts '6. Exit'
  end
end
