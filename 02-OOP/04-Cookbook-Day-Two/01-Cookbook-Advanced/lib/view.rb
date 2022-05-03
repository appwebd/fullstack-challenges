class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} #{recipe.name} #{recipe.description} #{recipe.rating}"
    end
  end

  def ask_for_index_to_remove
    puts 'Please choose the recipe number, that you would like to remove?'
    gets.chomp.to_i - 1
  end

  def ask_for_the_name
    puts 'Enter a name of recipe'
    print '> '
    gets.chomp
  end

  def ask_for_a_description
    puts 'Enter a description of recipe'
    print '> '
    gets.chomp
  end

  def ask_for_ranking
    puts 'Enter a ranking value for your recipe (float number is allowed)'
    print '> '
    gets.chomp
  end

  def ask_recipe_to_scraping
    puts 'What ingredient would you like a recipe for?'
    print '>'
    gets.chomp
  end

  def view_looking_for(recipe_lookup)
    puts "Looking for \"#{recipe_lookup}\" recipes on the Internet..."
  end

  def ask_recipe_to_import
    puts "\n\n"
    puts 'Which recipe would you like to import? (enter a number range: 1-5)'
    print '> '
    gets.chomp.to_i
  end

  def ask_index_for_mark_done
    puts 'Enter a index '
    print '> '
    gets.chomp.to_i
  end
end
