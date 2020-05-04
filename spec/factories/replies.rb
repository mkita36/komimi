FactoryBot.define do
  factory :reply do
    comment { "初めてのツイートおめでとうございます。" }
    association :user
    association :tweet
  end
end
