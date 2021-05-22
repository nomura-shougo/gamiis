class ParticipationsController < ApplicationController
  def create
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to signin_url
      return
    end

    participation = Participation.new(user_id: current_user.id, topic_id: params[:topic_id])
    if participation.save
      flash[:success] = "参加しました"
    else
      flash[:danger] = "参加できませんでした"
    end
    redirect_to topic_posts_url(params[:topic_id])
  end

  def destroy; end

  private

    def post_params
      params.require(:post).permit(:post_type, :content).merge(topic_id: params[:topic_id])
    end
end
