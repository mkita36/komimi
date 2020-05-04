FactoryBot.define do
  factory :reply do
    comment { 'お試しリプライ' }
    association :user
    association :tweet
  end
end