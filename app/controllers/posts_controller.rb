# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    # Add logic here, e.g., load resources or render a view
  end

  def index
    @posts = current_user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to dashboard_path, notice: 'Post scheduled successfully.'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :scheduled_at)
  end
end
