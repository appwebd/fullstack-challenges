OLD_DIVIDERS = [1000, 500, 100, 50, 10, 5, 1]
OLD_CHAR = %w[M D C L X V I]

NEW_DIVIDERS = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
NEW_CHAR = %w[M CM D CD C XC L XL X IX V IV I]

def old_roman_numeral(an_integer)
  roman = ""
  OLD_DIVIDERS.each_with_index do |divider, index|
    t = an_integer / divider
    t.times do
      roman.insert(-1, OLD_CHAR[index])
    end
    an_integer = an_integer % divider
  end
  roman
end

def new_roman_numeral(an_integer)
  roman = ""
  NEW_DIVIDERS.each_with_index do |divider, index|
    t = an_integer / divider
    t.times do
      roman.insert(-1, NEW_CHAR[index])
    end
    an_integer = an_integer % divider
  end
  roman
end
