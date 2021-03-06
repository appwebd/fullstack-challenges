class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    puts '-' * 33
    puts "Welcome to your DEV Pocket Reader"
    puts '-' * 33

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
    when 2 then @controller.save_post_for_later
    when 3 then @controller.read_post
    when 4 then @controller.mark_post_as_read
    when 5 then stop
    else
      puts "Please press 1, 2, 3, 4 or 5"
    end
  end

  def stop
    @running = false
  end

  def display_menu
    puts ""
    puts '-' * 28
    puts 'What do you want to do next?'
    puts '-' * 28
    puts '1. List posts'
    puts '2. Save post for later'
    puts '3. Read post'
    puts '4. Mark post as read'
    puts '5. Exit'
    puts '> '
  end
end
