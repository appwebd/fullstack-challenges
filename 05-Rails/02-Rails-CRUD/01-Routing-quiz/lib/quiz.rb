# Below are five questions for you to answer. Read each of the questions
# and make sure each of the methods return the correct answer.

# Return a `string` with the command you would run in your terminal
# to launch a rails server so that you could visit your app in development
# at `http://localhost:3000`.
def launching_a_rails_server
  'rails server'
end

# Below there are three variables defined with the three different
# steps required to add a new page to your rails app. Add these variables
# to the Array returned so that these steps are in the correct order.
#   a = 'generate controller and action'
#   b = 'create view'
#   c = 'add routes'
def rails_flow
  ['add routes', 'generate controller and action', 'create view']
end

# If you want to add an about page to your rails app, you will
# first need to add a new route. Return a `string` with the line you would
# add to your `config/routes.rb` file, so that you could visit your page
# at `localhost:3000/about` (you will need to specify the controller and
# action somehow....).
def route_to_about_page
  "get 'about', to: 'pages#about'"
end

# Return a `string` with the command you would run in the terminal to
# generate a `pages` controller, with an `about` action.
def generate_controller_command
  'rails generate controller Pages about'
end

# Return a `string` with the file path (from the root of your rails
# application) to the view corresponding to the controller action generated
# in the question above (the `about` action, in the `pages` controller).
def naming_conventions
  'app/views/pages/about.html.erb'
end
