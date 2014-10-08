class WelcomeController < ApplicationController
  def index
    @comments = Comment.all
    @users = User.all
    @posts = Post.all
  end
end
