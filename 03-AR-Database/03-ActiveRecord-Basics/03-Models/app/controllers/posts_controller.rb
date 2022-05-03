require_relative '../views/posts_view'
require_relative '../models/post'

class PostsController
  def initialize
    @view = PostsView.new
  end

  # gather all posts from the database
  # give them to the view to be printed
  def index
    @view.display
  end

  def create
    title = @view.ask_for_string('Title ?')
    url = @view.ask_for_string('Url ?')
    post = Post.new({ title: title, url: url, votes: 0 })
    post.save
  end

  # update a post
  def update
    index = @view.ask_user_for_index
    title = @view.ask_for_string('Title ?')
    url = @view.ask_for_string('Url ?')

    post_record = Post.find(index) if index.positive?

    unless post_record.nil?
      post_record.title = title
      post_record.url = url
      post_record.save
    end
  end

  # destroy a post
  def destroy
    index = @view.ask_user_for_index
    post = Post.find(index) if index.positive?
    unless post.nil?
      post.delete(index)
      post.save
    end
  end

  # increment the `votes` column for a post
  def upvote
    index = @view.ask_user_for_index
    post = Post.find(index)
    unless post.nil?
      post.votes += 1
      post.save
    end
  end
end
