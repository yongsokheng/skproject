FactoryGirl.define do
  factory :artist do
    en_name Faker::Name.name
    kh_name Faker::Name.name
  end
end
