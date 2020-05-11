class TimelinesController < ApplicationController

  def index
    if current_user.profile.present?
      @timelines = Tweet.where(user: current_user).or(Tweet.where(user: current_user.following_user)).order(created_at: :desc)
      @tweet = current_user.tweets.build
      session[:path_back_from_profile] = root_path
      session[:path_back_from_tweet] = root_path
    else
      redirect_to new_profile_path(current_user)
    end
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    respond_to do |format|
      if @tweet.save
        format.js
      else
        format.js {render 'new'}
      end
    end
  end

  private

    def tweet_params
      params.require(:tweet).permit(:user_id, :content)
    end

end