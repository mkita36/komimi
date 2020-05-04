FactoryBot.define do
  factory :tweet do
    content { 'お試しツイート' }
    association :user
  end
end