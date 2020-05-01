require 'rails_helper'

RSpec.describe "プロフィール", type: :request do
  describe 'プロフィール登録' do
    before do
      @user = FactoryBot.create(:user)
      sign_in @user
    end
    it '登録画面にアクセスすること' do
      get new_user_profile_path(@user)
      expect(response.body).to include('プロフィール登録')
    end
    it '登録していない場合、ルート画面から登録画面に転送されること' do
      get timelines_path
      expect(response).to redirect_to new_user_profile_path(@user)
    end
    it '登録すること' do
      profile = FactoryBot.build(:profile, user: @user)
      expect {
      post user_profiles_path(@user), params: { profile: profile.attributes }
      }.to change(Profile, :count).by(1)
    end
    it '登録内容が反映されていること' do
      profile = FactoryBot.build(:profile, user: @user)
      post user_profiles_path(@user), params: { profile: profile.attributes }
      expect(@user.profile.live_in).to include("東京都")
      p @user.profile
    end
    it '登録後、ユーザー一覧画面に転送されること' do
      profile = FactoryBot.build(:profile, user: @user)
      post user_profiles_path(@user), params: { profile: profile.attributes }
      expect(response).to redirect_to users_path
    end
  end

  describe '自分のプロフィールの確認・編集' do
    before do
      @user = FactoryBot.create(:user)
      @profile = FactoryBot.create(:profile, user:@user)
      sign_in @user
    end
    it '確認画面にアクセスすること' do
      get user_profile_path(@user, @user.profile)
      expect(response.body).to include("プロフィール編集")
    end
    it '編集画面にアクセスすること' do
      get edit_user_profile_path(@user, @user.profile)
      expect(response.body).to include("登録")
    end
    it '編集すること' do
      p @user.profile.attributes
      profile = FactoryBot.build(:profile, self_introduction: "初めまして", live_in: "京都府京都市", birthday: "1992-02-02".to_date, user: @user)
      patch user_profile_path(@user, @profile), params: { profile: profile.attributes }
      expect(response).to redirect_to user_profile_path(@user, @user.profile)
    end
  end
end