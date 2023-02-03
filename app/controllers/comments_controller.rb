class CommentsController < ApplicationController
  before_action :new
  def new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = Comment.new(params.require(:comment).permit(:text).merge(author_id: current_user.id, post_id: params[:post_id]))
    @comment.save
    redirect_to user_post_path(@post.author_id, @post)
  end
end
