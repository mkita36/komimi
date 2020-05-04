require 'rails_helper'

RSpec.describe Profile, type: :model do

  it '有効なファクトリを持つこと' do
    expect(FactoryBot.build(:profile)).to be_valid
  end
end