class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @comments = Comment.all
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments
  end
end
