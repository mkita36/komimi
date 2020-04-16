class TimelinesController < ApplicationController

  def index
    @timelines = Tweet.all.order(created_at: :desc)
    @tweet = current_user.tweets.build
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

  private

    def tweet_params
      params.require(:tweet).permit(:user_id, :content)
    end

end