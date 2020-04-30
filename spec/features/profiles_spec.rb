require 'rails_helper'

RSpec.feature "Profiles", type: :feature do

  #ユーザーは新しいプロフィールを作成する
  scenario "user create a new profile" do
    user = FactoryBot.create(:user)
    visit new_user_registration_path
    fill_in "user[email]", with: user.email
    fill_in "user[name]", with: user.name
    fill_in "user[password]", with: user.password
    fill_in "user[password_confirmation]", with: user.password_confirmation
    click_button "commit"

    expect {
      click_button "commit"
    }.to change(user.profile, :count).by(1)
  end
end
