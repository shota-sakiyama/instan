class FavoritesController < ApplicationController
  def index
    @posts = Post.joins(:favorites).where(favorites:{user_id: params[:user_id]})
  end

  def create
    @favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
