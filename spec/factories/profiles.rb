FactoryBot.define do
  factory :profile do
    self_introduction { 'よろしくお願いします。' }
    live_in { '東京都中央区' }
    birthday { '1991-01-01' }
    association :user

  # 画像を登録する場合
    trait :with_image do
      image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/files/sample.jpg')) }
    end
  end
end