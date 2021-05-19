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

  def show; end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
