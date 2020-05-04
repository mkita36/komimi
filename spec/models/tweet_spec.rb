require 'rails_helper'

RSpec.describe Tweet, type: :model do

  it '有効なファクトリを持つこと' do
    expect(FactoryBot.build(:tweet)).to be_valid
  end

  # ツイートが140文字以下でないと無効な状態であること
  it { is_expected.to validate_length_of(:content). is_at_most(140) }
end