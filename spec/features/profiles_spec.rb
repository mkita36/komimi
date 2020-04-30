require 'rails_helper'

RSpec.feature "Profiles", type: :feature do

  #ユーザーは新しいプロフィールを作成する
  scenario "user create a new profile" do
    visit new_user_registration_path ビルドにして
    fill_in "user[email]", with: "1@sumple.com"
    fill_in "user[name]", with: "イチロー"
    fill_in "user[password]", with: "111111"
    fill_in "user[password_confirmation]", with: "111111"
    click_button "commit"

    fill_in "profile[self_introduction]", with: "よろしくお願いします"
    fill_in "profile[live_in]", with: "東京都墨田区"
    fill_in "profile[birthday]", with: "19900101"
    click_button "commit"
    expect(page).to have_content "新規登録完了。まずは誰かをフォローしてみよう！"
  end
end