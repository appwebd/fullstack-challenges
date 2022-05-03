require_relative '../models/post'
require_relative 'base_view'

# @return implement some methods here when controller needs to `puts` or `gets`
class PostsView < BaseView
  def display
    posts = Post.all
    posts.each do |element|
      puts "#{element.id} #{element.title} #{element.url} #{element.votes}"
    end
  end
end
