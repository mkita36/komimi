require 'rails_helper'

RSpec.describe User, type: :model do

  it '名前、メールアドレス、パスワードがあれば有効であること' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  # 名前がなければ無効な状態であること
  it { is_expected.to validate_presence_of :name}

  # メールアドレスがなければ無効な状態であること
  it { is_expected.to validate_presence_of :email}

  # 重複したメールアドレスなら無効な状態であること
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

  # パスワードが6文字以下だと無効な状態であること
  it { is_expected.to validate_length_of(:password). is_at_least(6).with_message('の文字数が短すぎます')}

  it 'パスワードと確認用パスワードが一致しないと無効な状態であること' do
    user = FactoryBot.build(:user, password: '111111', password_confirmation: '111112')
    user.valid?
    expect(user.errors[:password_confirmation]).to include('はパスワードと一致しません')
  end
end