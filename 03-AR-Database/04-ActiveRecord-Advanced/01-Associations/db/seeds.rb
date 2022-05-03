require "faker"
require_relative '../app/models/user'
require_relative '../app/models/post'
#
# Write a seed
#
puts 'Creating 5 fake user...'
5.times do
  Faker::Config.random = Random.new(1)
  puts 'Generando User'
  user = User.new(
    username: Faker::Name.unique.name,
    email: Faker::Internet.email
  )
  user.save!
  puts user.id
  6.times do
    puts 'Generando Post'
    post = Post.new(
      title: Faker::TvShows::Stargate.quote,
      url: Faker::Internet.url,
      votes: (rand * 10).to_i,
      user_id: user.id
    )
    post.save!
  end
end
puts 'Finished!'
