require_relative 'recipe'
require 'open-uri'
require 'nokogiri'

class ScrapeAllrecipesService
  def initialize(keyword)
    @keyword = keyword
  end

  def get_token(html_doc, tag)
    html_doc.css(tag).text.strip
  end

  def get_rating(html_doc, tag)
    rating = get_token(html_doc, tag)
    rating.gsub('Rating: ', '')
    rating.gsub(' stars', '')
  end

  def get_tokens(block_html)
    name = get_token(block_html, '.card__titleLink')
    description = get_token(block_html, '.card__summary')
    rating = get_rating(block_html, '.review-star-text')
    { name: name, description: description, rating: rating }
  end

  def search
    url = "https://www.allrecipes.com/search/results/?search=#{@keyword}"

    recipes_list = []
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)

    html_doc.search('.card__detailsContainer-left').first(5).each do |block_html|
      hash_result = get_tokens(block_html)
      recipes_list.push(Recipe.new(hash_result[:name], hash_result[:description], hash_result[:rating], false))
    end
    recipes_list
  end
end
