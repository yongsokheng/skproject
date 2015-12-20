FactoryGirl.define do
  factory :country do
    en_name Faker::Address.country
    kh_name Faker::Address.country
  end
end
