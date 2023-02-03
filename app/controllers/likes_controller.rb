class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]
  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @post.likes.create(author_id: current_user.id)
    end
    redirect_to user_post_path(@post.author_id, @post)
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(author_id: current_user.id, post_id:
    params[:post_id]).exists?
  end
end
