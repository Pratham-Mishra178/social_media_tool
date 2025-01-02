class PagesController < ApplicationController
  def login
  end

  def dashboard
    @posts = Post.all
  end
end
