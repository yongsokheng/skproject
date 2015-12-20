FactoryGirl.define do
  factory :song do
    en_title Faker::Lorem.word
    kh_title Faker::Lorem.word
    lyric Faker::Lorem.paragraph
    url "/audios/a.mp3"
    image "assets/1.jpg"
    album
    # promotion_image
    country
  end
end
