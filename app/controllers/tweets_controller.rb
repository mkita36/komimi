class TweetsController < ApplicationController
  before_action :set_my_tweet, only: [:destroy]
  before_action :set_tweet, only: [:show]

  def show
    @replies = @tweet.replies.order(created_at: :desc)
    @reply = current_user.replies.build
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

end