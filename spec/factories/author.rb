FactoryBot.define do
  factory :author do
    name { Faker::Name.name }

    factory :author_with_books do
      transient do
        book_count { 2 }
      end

      after(:create) do |author, evaluator|
        FactoryBot.create_list(:book, evaluator.book_count, author: author)
      end
    end
  end
end
