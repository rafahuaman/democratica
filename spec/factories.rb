FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
    state "NY"
    district 1

    factory :admin do
      admin true
    end
  end

  factory :identity do
    user
    provider "Twitter"
    uid 100
    access_token "XXX"
    access_secret "YYY"

  end

  factory :congress_member, class: CongressMember  do
    sequence(:first_name)  { |n| "name #{n}" }
    sequence(:last_name)  { |n| "last name #{n}" }
    state "DC"
    sequence(:district)  { |n|  n }
    party "R"
    twitter_handle "@handle"
    type_by_house "Representative"

    factory :senator  do
      district "N/A"
      type_by_house "Senator"
    end

    factory :representative do
      type_by_house "Representative"
    end
  end

  factory :rally do
    sequence(:title) { |n| "Lorem ipsum #{n}" }
    content "Lorem ipsum"
    twitter_template "#democratica"
    user
  end

  factory :comment do
    body "Lorem ipsum"
    user
    rally

    factory :child_comment do 
      parent_id nil
    end
  end
end