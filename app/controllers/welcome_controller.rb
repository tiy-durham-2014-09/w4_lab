class WelcomeController < ApplicationController
  before_action :authenticate

  def index
    @users = User.all
    @posts = Post.all.order(created_at: :desc)
    @comments = Comment.all
  end
end
