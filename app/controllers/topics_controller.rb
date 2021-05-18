class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = User.new(user_params)
    if @topic.save
      flash[:success] = "グループの登録が完了しました"
      redirect_to topics_url
    else
      render 'new'
    end
  end

  private

    def topic_params
      params.require(:topic).permit(:name)
    end
end
