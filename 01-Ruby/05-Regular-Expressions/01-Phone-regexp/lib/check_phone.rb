# Return true or false?
def french_phone_number?(phone_number)
  phone_number.match?(/\A\^(0|\+33[\s-]?)[1-9][\s-]?(\d{2}[\s-]?){4}$/)
end
