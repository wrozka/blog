FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "My #{n} post" }
    sequence(:content) { |n| "This is my #{n}th post" }

    author "Joe"
  end
end
