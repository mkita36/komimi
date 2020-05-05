require 'rails_helper'

RSpec.describe Profile, type: :model do

  it '自己紹介、居住地、誕生日があれば有効であること' do
    expect(FactoryBot.build(:profile)).to be_valid
  end

  it '画像が登録できること' do
    expect{
      FactoryBot.create(:profile, :with_image)
    }.to change(ActiveStorage::Attachment, :count).by(1)
  end

  # 自己紹介がなければ無効な状態であること
  it { is_expected.to validate_presence_of :self_introduction}

  # 居住地がなければ無効な状態であること
  it { is_expected.to validate_presence_of :live_in}

  # 誕生日がなければ無効な状態であること
  it { is_expected.to validate_presence_of :birthday}
end