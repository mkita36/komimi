class TweetsController < ApplicationController
  before_action :set_my_tweet, only: [:destroy]
  before_action :set_tweet, only: [:show]
  
  def index
    @tweets = current_user.tweets.order(created_at: :desc)
    @tweet = current_user.tweets.build
  end

  def show
    @replies = @tweet.replies.order(created_at: :desc)
    @reply = current_user.replies.build
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    respond_to do |format|
      if @tweet.save
        format.js
      else
        format.js { head :no_content}
      end
    end
  end

  def destroy
    @tweet.destroy
    redirect_to user_profile_path(current_user, current_user.profile), notice: '削除完了'
  end

  private

    def set_my_tweet
      @tweet = current_user.tweets.find(params[:id])
    end

    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:user_id, :content)
    end
end