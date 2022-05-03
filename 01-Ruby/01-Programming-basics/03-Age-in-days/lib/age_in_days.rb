# This "require" line loads the contents of the 'date' file from the standard
# Ruby library, giving you access to the Date class.
require 'date'

# Return the age expressed in days given the day, month, and year of birth
def age_in_days(day, month, year)
  birthdate = Date.new(year, month, day)
  (Date.today - birthdate).to_i
end
