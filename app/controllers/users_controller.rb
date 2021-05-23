class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザ登録が完了しました"
      redirect_to topics_url
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: "DESC").page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to action: :show
    else
      render 'edit'
    end
  end

  def topics
    @user = User.find(params[:id])
    @topics = @user.topics.order(created_at: "DESC").page(params[:page]).per(10)
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :picture)
    end
end
