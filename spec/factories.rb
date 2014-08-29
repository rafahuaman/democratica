FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :congress_member do
    prefix "prefix"
    sequence(:first_name)  { |n| "name #{n}" }
    middle_name "M"
    sequence(:last_name)  { |n| "last name #{n}" }
    suffix "suffix"
    address "123 address"
    city "city"
    state "DC"
    zip4 "20515-0104"
    sequence(:district)  { |n|  n/10 < 1 ? "AL0#{n}" : "AL#{n}" }
    party "R"
    twitter_handle "@handle"
  end

end