class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = current_user.tweets.order(created_at: :desc)
    @tweet = current_user.tweets.build
  end

  def new
    @tweet = current_user.tweets.build
  end

  def edit
  end

  def show
    @replies = @tweet.replies.order(created_at: :desc)
  end

  def create
    @tweet = Tweet.new(tweet_params)
    respond_to do |format|
      if @tweet.save
        format.js
        # redirect_to tweets_path, notice: '新規作成完了'
      else
        format.js { head :no_content}
        # render :new
      end
    end
  end

  def update
    if @tweet.update(tweet_params)
        redirect_to tweets_path, notice: '更新完了'
    else
        render :edit
    end
end

def destroy
  @tweet.destroy
  redirect_to tweets_url, notice: '削除完了'
end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:content, :user_id)
  end

end