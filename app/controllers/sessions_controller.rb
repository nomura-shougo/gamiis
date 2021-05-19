class SessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:session][:email], params[:session][:password])
    if @user
      redirect_back_or_to(root_path)
    else
      flash.now[:danger] = 'ログインできませんでした。メールアドレスおよびパスワードをご確認ください。'
      render :new
    end
  end

  def destroy
    logout
    flash[:success] = 'ログアウトしました。'
    redirect_to root_path
  end

  private

    def session_params
      params.require(:session).permit(:email, :password)
    end
end
