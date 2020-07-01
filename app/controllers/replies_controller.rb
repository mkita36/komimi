class RepliesController < ApplicationController
  before_action :set_tweet, only: %i(edit create update destroy)
  before_action :set_reply, only: %i(edit update destroy)

  def index
    @replies = current_user.replies.order(created_at: :desc).page(params[:page])
  end

  def edit
  end

  def create
    @reply = @tweet.replies.build(user: current_user, comment: reply_params[:comment])
    respond_to do |format|
      if @reply.save
        format.js
      else
        format.js {render 'new'}
      end
    end
  end

  def update
    if @reply.update(reply_params)
      redirect_to user_replies_path(current_user), notice: '更新完了'
    else
      render :edit
    end
  end

  def destroy
    @reply.destroy
    redirect_to user_replies_path(current_user), notice: '削除完了'
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