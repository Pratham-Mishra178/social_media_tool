# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    # Fetch the posts that are scheduled by the current user
    @posts = current_user.posts.order(scheduled_at: :asc) # Adjust ordering based on `scheduled_at`
  end

  def index
    # List all posts (can be used for listing scheduled posts or past posts)
    @posts = current_user.posts
  end

  def new
    # Initialize a new Post object for the creation form
    @post = Post.new
  end

  def create
    # Create a new post associated with the current user
    @post = current_user.posts.build(post_params)
    
    if @post.save
      redirect_to dashboard_path, notice: 'Post scheduled successfully.'
    else
      flash[:alert] = 'There was an error scheduling the post.'
      render :new
    end
  end

  private

  def post_params
    # Permit additional fields like title, content, post_type, and attachments (image, video)
    params.require(:post).permit(:title, :content, :scheduled_at, :post_type, :image, :video)
  end
end
