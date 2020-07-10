require 'rails_helper'

RSpec.feature 'JavaScriptでツイート', type: :feature do
  before do
    @user = FactoryBot.create(:user, profile: FactoryBot.create(:profile))
    sign_in @user
  end
  scenario 'ツイートする', js: true do
    visit timelines_path
    fill_in 'tweet[content]', with: 'JavaScriptでお試しツイート'
    expect do
      click_button 'commit'
      expect(page).to have_content 'JavaScriptでお試しツイート'
    end.to change(@user.tweets, :count).by(1)
  end
end