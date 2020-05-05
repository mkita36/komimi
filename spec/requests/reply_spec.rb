require 'rails_helper'

RSpec.describe 'リプライ', type: :request do
  describe '自分のリプライの確認・削除' do
    before do
      @user = FactoryBot.create(:user)
      profile = FactoryBot.create(:profile, user: @user)
      @other_user = FactoryBot.create(:user)
      profile = FactoryBot.create(:profile, user: @other_user)
      @other_tweet = FactoryBot.create(:tweet, user: @other_user)
      @reply = FactoryBot.create(:reply, user: @user, tweet: @other_tweet)
      sign_in @user
    end
    it '確認画面にアクセスすること' do
      get user_replies_path(@user)
      expect(response).to have_http_status(200)
    end
    it '編集画面にアクセスすること' do
      get edit_tweet_reply_path(@other_tweet, @reply)
      expect(response).to have_http_status(200)
    end
    it '編集すること' do
      get edit_tweet_reply_path(@other_tweet, @reply)
      @reply['comment'] = '修正しました'
      patch tweet_reply_path(@other_tweet, @reply), params: {reply: @reply.attributes}
      expect(response).to redirect_to user_replies_path(@user)
    end
    it '削除すること' do
      expect {
        delete tweet_reply_path(@other_tweet, @reply)
      }.to change(@user.replies, :count).by(-1)
    end
  end
end