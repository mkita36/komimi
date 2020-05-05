require 'rails_helper'

RSpec.describe Reply, type: :model do

  it 'ユーザーと本文があれば有効であること' do
    expect(FactoryBot.build(:reply)).to be_valid
  end

  # 本文がなければ無効な状態であること
  it { is_expected.to validate_presence_of :comment}

  # 本文が140文字以下でないと無効な状態であること
  it { is_expected.to validate_length_of(:comment). is_at_most(140) }
end