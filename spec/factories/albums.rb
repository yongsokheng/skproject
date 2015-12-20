FactoryGirl.define do
  factory :album do
    en_name Faker::Name.name
    kh_name Faker::Name.name
    year Faker::Number.between(2010, 2015)
    image "1"
    production
  end
end
