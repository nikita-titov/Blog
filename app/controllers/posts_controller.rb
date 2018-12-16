class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]

  # scope :newwest, -> { order('created_at DESC') }
  # scope :sport_theme, -> { where(category_id: 1) }

  def index
    @posts = Post.all.order('created_at DESC').paginate(page: params[:page], per_page: 4)
  end

  def new
    @post = Post.new
  end

  def create
  	@post = Post.new(post_params)

  	if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update

    if @post.update(params[:post].permit(:title, :body))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
