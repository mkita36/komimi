FactoryBot.define do
  factory :tweet do
    content { "初めてのツイートです。" }
    association :user
  end
end
