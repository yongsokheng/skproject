FactoryGirl.define do
  factory :production do
    en_name Faker::Name.name
    kh_name Faker::Name.name
  end
end
