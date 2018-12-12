class CommentsController < ApplicationController
  before_action :set_comments, only: [:create, :destroy]
  before_action :authenticate_user!

  def create
    @comment = @post.comments.create(params[:comment].permit(:name, :body))
    redirect_to post_path(@post)
  end

  def destroy
  	@comment = @post.comments.find(params[:id])
  	@comment.destroy
    redirect_to post_path(@post)
  end

  private

  def set_comments
  	@post = Post.find(params[:post_id])
  end

end
