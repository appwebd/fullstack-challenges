require_relative 'view'
require_relative 'recipe'

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
    name = @view.ask_user_for('Enter a name of recipe')
    description = @view.ask_user_for('Enter a description of recipe')
    recipe = Recipe.new(name, description)
    @cookbook.add_recipe(recipe)
  end

  # para borrar una receta actual
  def destroy
    list
    recipe_index = @view.ask_for_index_to_remove
    @cookbook.remove_recipe(recipe_index)
    list
  end
end
