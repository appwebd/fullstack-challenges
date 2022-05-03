def analyze(text)
  result = {}

  unless text.empty?
    word_count = word_count(text)
    sentence_count = sentence_count(text)
    paragraph_count = paragraph_count(text)

    result = {
      character_count: character_count(text), char_count_excluding_spaces: char_count_excluding_spaces(text),
      line_count: line_count(text), word_count: word_count, sentence_count: sentence_count,
      paragraph_count: paragraph_count, average_words_per_sentence: word_count.fdiv(sentence_count).round(2),
      average_sentences_per_paragraph: sentence_count.fdiv(paragraph_count).round(2)
    }
  end
  result
end

def character_count(text)
  text.length
end

def char_count_excluding_spaces(text)
  regexp = /\s/
  text.gsub(regexp, '').size
end

def line_count(text)
  regexp = /$/
  text.match(regexp).size
end

def word_count(text)
  regexp = /\w+/
  text.scan(regexp).size
end

def sentence_count(text)
  regexp = /\.!?/
  text.scan(regexp).map(&:strip).count
end

def paragraph_count(text)
  regexp = /\n\n/
  text.split(regexp).size
end
