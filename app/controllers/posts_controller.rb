class PostsController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @q = Post.ransack(params[:q])
    @chat_posts = @q.result(distinct: true)
                    .where(topic_id: @topic.id)
                    .with_post_type(:chat)
                    .order(created_at: "DESC")
                    .page(params[:chat_page])
                    .per(10)
    @find_members_posts = @q.result(distinct: true)
                            .where(topic_id: @topic.id)
                            .with_post_type(:find_members)
                            .order(created_at: "DESC")
                            .page(params[:find_members_page])
                            .per(10)
    @new_post = Post.new
  end

  def create
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to action: :index
      return
    end

    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "送信しました"
    end
    redirect_to action: :index
  end

  private

    def post_params
      params.require(:post).permit(:post_type, :content).merge(topic_id: params[:topic_id])
    end
end
