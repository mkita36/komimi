class RepliesController < ApplicationController
  before_action :set_tweet, only: [:new, :edit, :update]
  before_action :set_reply, only: [:show, :edit, :update, :destroy]

  def index
    @replies = current_user.replies
  end

  def show
  end

  def new
    @reply = @tweet.replies.build(user: current_user)
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
      @reply = @tweet.replies.find(params[:id])
    end

    def reply_params
      params.require(:reply).permit(:comment, :user_id, :tweet_id)
    end

end
