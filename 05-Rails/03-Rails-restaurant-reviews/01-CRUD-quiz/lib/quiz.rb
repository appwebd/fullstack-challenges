# Below are five questions for you to answer. Read each of the questions
# and make sure each of the methods return the correct answer.

# The `Array` below has the four letters that make up the `CRUD`
# acronym. Update each element of the array so that you write out the
# four verbs that describe the CRUD actions.

def crud
  %w[create read update delete]
end

# Return a `String` with the command you would run in the terminal to
# generate a `Restaurant` model that has two fields: name(`String`) and
# stars(`Integer`).
def generate_model_command
  'rails generate model Restaurant name stars:integer'
end

# Update the `Array` returned with the paths to the two files created
# for you when run the model generator for a `Restaurant` model (from the
# question above). Use `YYYYMMDDHHMMSS` for any timestamps.
def files_created_by_model_generator
  %w[app/models/restaurant.rb db/migrate/YYYYMMDDHHMMSS_create_restaurants.rb]
end

# There are seven `CRUD` routes that we need to know by heart. But
# we don't want to write all of them in our routes. Return a `String` with
# the single line we would add in `config/routes.rb` to add all seven CRUD
# routes for our `Restaurant` model.
def crud_routing
  'resources :restaurants'
end

# If we have all seven CRUD routes, we will also need seven instance
# methods in our `RestaurantsController`. Return an `Array` with the seven
# controller actions that go along with the CRUD routes.
def controller_actions
  %w[index new create edit update show destroy]
end
