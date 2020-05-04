require 'rails_helper'

RSpec.describe "フォロー・フォロワー関係", type: :request do
  describe 'ユーザー一覧確認・フォローする' do
    before do
      @user = FactoryBot.create(:user)
      @other_user = FactoryBot.create(:user)
      @profile = FactoryBot.create(:profile, user: @user)
      @other_profile = FactoryBot.create(:profile, user: @other_user)
      sign_in @user
    end
    it 'ユーザー一覧画面にアクセスすること' do
      get users_path
      expect(response).to have_http_status(200)
    end
    it 'フォローすること' do
      expect{
      post follow_path(@other_user)
      }.to change(@user.follower, :count).by(1)
    end
    it 'フォローを外すこと' do
      post follow_path(@other_user)
      expect{
      post unfollow_path(@other_user)
      }.to change(@user.follower, :count).by(-1)
    end
  end
end