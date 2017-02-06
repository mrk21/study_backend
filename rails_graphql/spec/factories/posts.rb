FactoryGirl.define do
  factory :post do
    association :user, factory: :user
    sequence(:title) { |n| "Title#{n}" }
    sequence(:body) { |n| "Body#{n}" }
  end
end
