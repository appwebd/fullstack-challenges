require "morse"

def encode(text)
  # write a method which returns the morse sentence for the given text
  # NOTE: you may want to extract a `encode_word` method
  words = text.gsub(/[,.!?']/, '').split
  words.map { |word| encode_word(word) }.join('|')
end

def encode_word(word)
  word.chars.map { |letter| MORSE[letter.upcase] }.join(' ')
end
