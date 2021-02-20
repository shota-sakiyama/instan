class PostsController < ApplicationController
  before_action :authenticate_user,{only: [:new, :create, :confirm, :edit, :update, :show, :destroy]}

  def index
    @posts = Post.all
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      # PostMailer.post_mail(@post).deliver
      redirect_to posts_path
    else
      render :new
    end
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user != current_user
      redirect_to posts_path
    end
  end

  def show
    @post = Post.find(params[:id])
    @post = current_user.posts.build(post_params)
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:content, :image, :image_cache)
  end
end
