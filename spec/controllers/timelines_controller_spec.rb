# require 'rails_helper'

# RSpec.describe TimelinesController, type: :controller do
#   describe '#index' do
#     before do
#       @user = FactoryBot.create(:user)
#       sign_in @user
#     end
    
#     it 'リクエストが成功すること' do
#       get :index
#       expect(response).to be_success
#     end
#   end
# end


# it 'ツイートフォームが表示されていること' do
#   get root_path
#   expect(response.body).to include 'Tweet'
# end
#     # 有効な属性値の場合
#     context "with valid attributes" do
#       # プロフィールを登録できること
#       it "create a profile" do
#         profile_params = FactoryBot.attributes_for(:profile)
#         sign_in @user
#         expect {
#           post user_profiles_path, params: {profile: profile_params}
#         }.to change(@user.profile, :count).by(1)
#       end
#     end
#   end
# end