# 5.times do
#   album = FactoryGirl.create :album
#   10.times do
#     FactoryGirl.create :song, en_title: Faker::Lorem.word,
#       kh_title: Faker::Lorem.word,
#       lyric: Faker::Lorem.paragraph,
#       album: album
#   end
# end

# 2.times do
#   song = Song.first
#   FactoryGirl.create :song_artist, song: song
# end

User.create! username: "admin", email: "admin@gmail.com", password: "12345678",
  password_confirmation: "12345678", admin: true

User.create! username: "user1", email: "user1@gmail.com", password: "12345678",
  password_confirmation: "12345678"
