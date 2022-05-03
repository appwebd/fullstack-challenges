def word_contains_two_p(sentence)
  # TODO: return the first word in `sentence` containing two 'p's
  regexp = /\w*p\w*p\w*/
  sentence.match(regexp)[0]
end

def word_before_exclamation_mark(sentence)
  # TODO: return the first word located before an exclamation mark
  # Hint: you may want to use `()` groups!
  regexp = /(\w+)!/
  sentence.match(regexp)[1]
end

def four_letter_word(sentence)
  # TODO: return the first four-letter word starting with 'b', followed with a comma `,`
  regexp = /b\w*,/
  sentence.match(regexp).to_s[0..3]
end

def last_five_letters(sentence)
  # TODO: return the last five letters of the sentence
  regexp = /\w{5}\z/
  sentence.match(regexp)[0]
end

def word_contains_ll(sentence)
  # TODO: return the first word containing two consecutive 'l'
  regexp = /\w*ll\w*/
  sentence.match(regexp)[0]
end

def six_letter_word(sentence)
  # TODO: return the first six-letter word, composed of letters from 'a' to 'r'
  regexp = /\w*[a-r]{6}/
  sentence.match(regexp)[0]
end

def all_capital_letters(sentence)
  # TODO: return all the capital letters as a string
  # Hint: use `scan` to get all the occurrences then `join` them
  regexp = /[A-Z]/
  sentence.scan(regexp).join
end
