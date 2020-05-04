require 'rails_helper'

RSpec.describe Reply, type: :model do

  it "有効なファクトリを持つこと" do
    expect(FactoryBot.build(:reply)).to be_valid
  end

  # リプライが140文字以下でないと無効な状態であること
  it { is_expected.to validate_length_of(:comment). is_at_most(140) }
end