require 'rails_helper'

RSpec.feature 'JavaScriptでリプライ', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    profile = FactoryBot.create(:profile, user:@user)
    other_user = FactoryBot.create(:user, profile: FactoryBot.create(:profile))
    profile = FactoryBot.create(:profile, user:other_user)
    @tweet = FactoryBot.create(:tweet, user: other_user)
    sign_in @user
  end

  scenario 'リプライする', js: true do
    visit tweet_path(@tweet)
    fill_in 'reply[comment]', with: 'JavaScriptでお試しリプライ'
    expect do
      click_button 'commit'
      expect(page).to have_content 'JavaScriptでお試しリプライ'
    end.to change(@user.replies, :count).by(1)
  end
end