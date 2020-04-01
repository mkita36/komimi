class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.all.order(id: "DESC")
  end

  def new
    @tweet = Tweet.new(user_id: current_user.id, user_name: current_user.name)
  end

  def edit
  end

  def show
  end

  def create
    @tweet = Tweet.new(tweet_params) # ストロングパラメーター処理後のtweet_paramsハッシュの情報を基にインスタンス化
    if @tweet.save
        redirect_to tweets_path, notice: '新規作成完了' # 9.1.6 redirect_to tweet_path(@book)の略
    else
        render :new # 9.1.5 render action: :new の略
    end
  end

  def update
    if @tweet.update(tweet_params)
        redirect_to tweets_path, notice: '更新完了'
    else
        render :edit
    end
end

def destroy
  @tweet.destroy
  redirect_to tweets_url, notice: '削除完了' # redirect_to tweets_path でもOK
end

  private

  def set_tweet
      @tweet = Tweet.find(params[:id]) # 8.2.3 paramsオブジェクトを通して、URIの:idというパラメーター部分に相当する値を渡す
  end

  def tweet_params
      params.require(:tweet).permit(:content, :user_id, :user_name) # 9.1.4 ストロングパラメーター
  end

end
