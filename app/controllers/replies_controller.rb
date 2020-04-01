class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :edit, :update, :destroy]

  def index
    @replies = Reply.all
  end

  def show
  end

  def new
    @reply = Reply.new(user_id: current_user.id, user_name: current_user.name, tweet_id: params[:id])
  end

  def edit
  end

  def create
    @reply = Reply.new(reply_params)
      if @reply.save
        redirect_to tweets_path, notice: 'Reply was successfully created.'
      else
        render :new
      end
  end

  def update
      if @reply.update(reply_params)
        redirect_to tweets_path, notice: 'Reply was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @reply.destroy
      redirect_to tweets_path, notice: 'Reply was successfully destroyed.'
  end

  private
    def set_reply
      @reply = Reply.find(params[:id])
    end

    def reply_params
      params.require(:reply).permit(:user_id, :user_name, :tweet_id, :comment)
    end
end
