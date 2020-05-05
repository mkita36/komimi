require 'rails_helper'

RSpec.describe 'プロフィール', type: :request do
  describe 'プロフィール登録' do
    before do
      @user = FactoryBot.create(:user)
      sign_in @user
    end
    it '登録画面にアクセスすること' do
      get new_user_profile_path(@user)
      expect(response).to have_http_status(200)
    end
    it '登録していない場合、ルート画面から登録画面に転送されること' do
      get timelines_path
      expect(response).to redirect_to new_user_profile_path(@user)
    end
    it '登録すること' do
      profile = FactoryBot.build(:profile, user: @user)
      expect {
        post user_profiles_path(@user), params: {profile: profile.attributes}
      }.to change(Profile, :count).by(1)
    end
    it '登録後、ユーザー一覧画面に転送されること' do
      profile = FactoryBot.build(:profile, user: @user)
      post user_profiles_path(@user), params: {profile: profile.attributes}
      expect(response).to redirect_to users_path
    end
  end

  describe '自分のプロフィールの確認・編集' do
    before do
      @user = FactoryBot.create(:user)
      profile = FactoryBot.create(:profile, user:@user)
      sign_in @user
    end
    it '確認画面にアクセスすること' do
      get user_profile_path(@user, @user.profile)
      expect(response).to have_http_status(200)
    end
    it '編集画面にアクセスすること' do
      get edit_user_profile_path(@user, @user.profile)
      expect(response).to have_http_status(200)
    end
    it '編集すること' do
      @user.profile['self_introduction'] = 'はじめまして'
      @user.profile['birthday'] = '1992-02-02'
      patch user_profile_path(@user, @user.profile), params: {profile: @user.profile.attributes}
      expect(response).to redirect_to user_profile_path(@user, @user.profile)
    end
  end

  describe '他人のプロフィールの確認' do
    before do
      @user = FactoryBot.create(:user)
      profile = FactoryBot.create(:profile, user:@user)
      @other_user = FactoryBot.create(:user)
      profile = FactoryBot.create(:profile, user:@other_user)
      sign_in @user
    end
    it '確認画面にアクセスすること' do
      get user_profile_path(@other_user, @other_user.profile)
      expect(response).to have_http_status(200)
    end
  end
end