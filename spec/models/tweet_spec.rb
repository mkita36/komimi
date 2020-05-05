require 'rails_helper'

RSpec.describe Tweet, type: :model do

  it 'ユーザーと本文があれば有効であること' do
    expect(FactoryBot.build(:tweet)).to be_valid
  end

  # 本文がなければ無効な状態であること
  it { is_expected.to validate_presence_of :content}

  # 本文が140文字以下でないと無効な状態であること
  it { is_expected.to validate_length_of(:content). is_at_most(140) }
end