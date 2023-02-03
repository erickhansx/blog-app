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

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text).merge(author_id: current_user.id))
    if @post.save
      flash[:notice] = 'Post saved!'
      redirect_to user_posts_path(current_user.id)
    else
      render :new
    end
  end
end
