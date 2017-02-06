FactoryGirl.define do
  factory :user, class: 'User' do
    sequence(:name) { |n| "User#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:password) { |n| "password#{n}" }
  end
end
