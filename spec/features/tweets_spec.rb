require 'rails_helper'

RSpec.feature 'ツイート（JavaScript）', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @profile = FactoryBot.create(:profile, user: @user)
    sign_in @user
  end
  scenario 'ツイートする', js: true do
    visit timelines_path
    fill_in 'tweet[content]', with: '初めてのツイートです。'
    expect{
    click_button 'commit'
    expect(page).to have_content 'Home'
    }.to change(@user.tweets, :count).by(1)
  end
end
