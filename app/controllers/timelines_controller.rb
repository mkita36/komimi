class TimelinesController < ApplicationController
  def index
    @timelines = Tweet.all.order(created_at: :desc)
  end
end