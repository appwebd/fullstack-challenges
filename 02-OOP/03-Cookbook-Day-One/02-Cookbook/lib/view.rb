class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} #{recipe.name} #{recipe.description}"
    end
  end

  def ask_user_for(message)
    puts "#{message.capitalize}?"
    print '> '
    return gets.chomp
  end

  def ask_for_index_to_remove
    puts "Please choose the recipe number, that you would like to remove?"
    gets.chomp.to_i - 1
  end
end
