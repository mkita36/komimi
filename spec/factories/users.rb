FactoryBot.define do
  factory :user do
    name { 'イチロー' }
    sequence(:email) { |n| "#{n}@sample.com" }
    password { '111111' }
    password_confirmation { '111111' }
  end
end