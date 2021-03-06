class TopicsController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def index
    @q = Topic.ransack(params[:q])
    @topics = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:success] = "グループの登録が完了しました"
      redirect_to topics_url
    else
      render 'new'
    end
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      flash[:success] = "グループ情報を更新しました"
      redirect_to action: :show
    else
      render 'edit'
    end
  end

  def destroy
    topic = Topic.find(params[:id])
    if topic.blank?
      flash[:danger] = 'グループが存在しません'
    else
      topic.destroy!
      flash[:success] = 'グループを削除しました'
    end

    redirect_to topics_url
  end

  private

    def topic_params
      params.require(:topic).permit(:name, :picture)
    end

    def correct_user
      return if logged_in? && current_user&.participations&.find_by(topic_id: params[:id])

      flash[:danger] = "グループ編集権限がありません"
      redirect_to(root_url)
    end
end
