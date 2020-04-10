class RepliesController < ApplicationController
  before_action :set_tweet, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_reply, only: [:edit, :update, :destroy]

  def index
    @replies = current_user.replies.order(created_at: :desc)
  end

  def new
    @reply = current_user.replies.build(tweet_id: @tweet)
    # @reply = @tweet.replies.build(user: current_user)
  end

  def edit
  end

  def create
    @reply = @tweet.replies.build(user: current_user, comment: reply_params[:comment])
      if @reply.save
        redirect_to tweet_path(@tweet), notice: 'Reply was successfully created.'
      else
        render :new
      end
  end

  def update
    if @reply.update(reply_params)
      redirect_to tweet_replies_path, notice: 'Reply was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @reply.destroy
      redirect_to tweet_path(@tweet), notice: 'Reply was successfully destroyed.'
  end

  private

    def set_tweet
      @tweet = Tweet.find(params[:tweet_id])
    end

    def set_reply
      @reply = current_user.replies.find(params[:id])
    end

    def reply_params
      params.require(:reply).permit(:comment)
    end

end