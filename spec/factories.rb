FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
    state "NY"

    factory :admin do
      admin true
    end
  end

  factory :congress_member do
    sequence(:first_name)  { |n| "name #{n}" }
    sequence(:last_name)  { |n| "last name #{n}" }
    state "DC"
    sequence(:district)  { |n|  n }
    party "R"
    twitter_handle "@handle"
    type "Representative"

    factory :senator do
      district "N/A"
      type "Senator"
    end

    factory :representative do
      type "Representative"
    end
  end

  factory :rally do
    sequence(:title) { |n| "Lorem ipsum #{n}" }
    content "Lorem ipsum"
    twitter_template "#democratica"
    user
  end
end