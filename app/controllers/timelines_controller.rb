class TimelinesController < ApplicationController
  def index
    @timelines = Tweet.all.order(created_at: :desc)
    @tweet = current_user.tweets.build
  end
end