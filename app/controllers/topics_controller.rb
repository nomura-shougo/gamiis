class TopicsController < ApplicationController
  def index
    @topics = Topic.all.page(params[:page]).per(10)
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

  def destroy
    topic = Topic.find(params[:id])
    if topic.blank?
      flash[:danger] = 'グループが存在しません'
    else
      topic.destroy!
      flash[:success] = 'グループを削除しました。'
    end

    redirect_to topics_url
  end

  private

    def topic_params
      params.require(:topic).permit(:name)
    end
end
