FactoryGirl.define do
  factory :book do
    sequence(:title) { |n| "Josh Rules, episode #{n}"}
    sequence(:author) { |n| "Josh Clone #{n}"}
    sequence(:year) { |n| "190#{n}"}
  end
end
