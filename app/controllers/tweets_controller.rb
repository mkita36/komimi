class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new(user_id: current_user.id, user_name: current_user.name)
  end

  def edit
  end

  def show
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
        redirect_to tweets_path, notice: '新規作成完了'
    else
        render :new
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
      params.require(:tweet).permit(:content, :user_id, :user_name)
  end

end
