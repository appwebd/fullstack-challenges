require "faker"
require_relative '../app/models/post'

# Write a seed to insert 100 posts in the database

puts 'Creating 100 fake posts...'
100.times do
  Faker::Config.random = Random.new(1)
  post = Post.new(
    title: Faker::TvShows::Stargate.quote,
    url: Faker::Internet.url,
    votes: (rand * 10).to_i
  )
  post.save!
end
puts 'Finished!'
