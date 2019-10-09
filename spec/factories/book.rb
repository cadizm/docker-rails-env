FactoryBot.define do
  factory :book do
    published_at { Faker::Date.between(from: 10.years.ago, to: Date.today) }
    association :author
  end
end
