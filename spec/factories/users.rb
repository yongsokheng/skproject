FactoryGirl.define do
  factory :user do
    username Faker::Name.name
    email "yongsokheng@gmail.com"
    password "12345678"
    password_cofirmation "12345678"
  end
end
