require 'rails_helper'

RSpec.feature '画像登録（プロフィール）', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    sign_in @user
  end
  scenario '画像登録する', js: true do
    visit new_user_profile_path(@user)
    attach_file 'profile[image]', '{Rails.root}/spec/files/sample.jpg'
    expect(page).to have_content 'attachment.jpg(image/jpeg'
  end
end
