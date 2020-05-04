FactoryBot.define do
  factory :profile do
    self_introduction { "よろしくお願いします。" }
    live_in { "東京都中央区" }
    birthday { "1991-01-01" }
    association :user
  end
end
