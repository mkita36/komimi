FactoryBot.define do
  factory :user do
    sequence(:name) { "イチロー" }
    sequence(:email) { |n| "#{n}@sample.com" }
    password { "111111" }
    password_confirmation { "111111" }

    trait :no_name do
      sequence(:name) {nil}
    end

    trait :no_email do
      sequence(:email) {nil}
    end

    trait :short_password do
      sequence(:password) { "11111" }
      sequence(:password_confirmation) { "11111" }
    end
  end
end
