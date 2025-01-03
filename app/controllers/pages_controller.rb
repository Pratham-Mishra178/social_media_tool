class PagesController < ApplicationController
  
  skip_before_action :authenticate_user!, only: [:login]

  def login
  end

  def dashboard
    @posts = Post.all
  end
end
