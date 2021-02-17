class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:edit, :update]}

  def new
    @user = User.new
    if logged_in?
      redirect_to posts_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
      session[:user_id] = @user.id
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user), alert: "不正なアクセスです。"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                :password_confirmation, :image, :image_cache)
  end
end
