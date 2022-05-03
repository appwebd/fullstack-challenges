require "json"
require "rest-client"
require_relative '../app/models/post'

#
# Write a seed to insert 10 posts in the database fetched from the Hacker News API.
#
puts 'Creating 10 Hacker-news posts...'
URL = 'https://hacker-news.firebaseio.com/v0/topstories.json'

array_result = JSON.parse(RestClient.get(URL))

iterator = 0
10.times do
  item = array_result[iterator]

  item_json = RestClient.get "https://hacker-news.firebaseio.com/v0/item/#{item}.json"
  item_array = JSON.parse(item_json)
  post = Post.new(
    title: item_array['title'],
    url: item_array['url'],
    votes: item_array['score']
  )
  post.save
  puts "[#{post.votes}] #{post.title} - #{post.url}"

  iterator += 1
end

puts 'Finished!'
