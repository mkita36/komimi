require 'rails_helper'

RSpec.describe "ツイート", type: :request do
  describe 'タイムライン' do
    before do
      @user = FactoryBot.create(:user)
      @profile = FactoryBot.create(:profile, user: @user)
      sign_in @user
    end
    it 'タイムライン画面にアクセスすること' do
      get timelines_path
      expect(response).to have_http_status(200)
    end
  end

  describe '自分のツイートの確認・削除' do
    before do
      @user = FactoryBot.create(:user)
      @profile = FactoryBot.create(:profile, user: @user)
      @tweet = FactoryBot.create(:tweet, user: @user)
      sign_in @user
    end
    it '確認画面にアクセスすること' do
      get tweet_path(@tweet)
      expect(response.body).to include('tweet')
    end
    it '削除すること' do
      expect {
      delete tweet_path(@tweet)
    }.to change(@user.tweets, :count).by(-1)
    end
  end

  describe '他人のツイートの確認' do
    before do
      @user = FactoryBot.create(:user)
      @profile = FactoryBot.create(:profile, user: @user)
      sign_in @user
    end
    it '確認画面にアクセスすること' do
      other_user = FactoryBot.create(:user)
      other_profile = FactoryBot.create(:profile, user: other_user)
      other_tweet = FactoryBot.create(:tweet, user: other_user)
      get tweet_path(other_tweet)
      expect(response.body).to include('tweet')
    end
  end
end