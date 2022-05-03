require_relative 'view'
require_relative 'recipe'
require_relative 'scrapeallrecipesservice'

class Controller
  # toma una instancia de Cookbook como argumento
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  # para mostrar la lista de todas las recetas
  def list
    @view.display(@cookbook.all)
  end

  # para crear una nueva receta
  def create
    name = @view.ask_for_the_name
    description = @view.ask_for_a_description
    ranking = @view.ask_for_ranking
    recipe = Recipe.new(name, description, ranking, false)
    @cookbook.add_recipe(recipe)
  end

  # para borrar una receta actual
  def destroy
    list
    recipe_index = @view.ask_for_index_to_remove
    @cookbook.remove_recipe(recipe_index)
    list
  end

  # Para importar receta desde la pagina web
  def import
    keyword = @view.ask_recipe_to_scraping
    @view.view_looking_for(keyword)
    recipes = ScrapeAllrecipesService.new(keyword).search
    @view.display(recipes)
    index = @view.ask_recipe_to_import
    while index >= 1 && index <= 5
      @cookbook.add_recipe(recipes[index - 1]) if index >= 1 && index <= 5
      index = @view.ask_recipe_to_import
    end
  end

  def mark_as_done
    list
    index = @view.ask_index_for_mark_done
    @cookbook.mark_as_done(index - 1)
  end
end
