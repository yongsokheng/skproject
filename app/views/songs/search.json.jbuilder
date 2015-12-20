json.array!(@songs) do |song|
  json.kh_title song.kh_title
  json.image  song.image.url
  json.album song.album
  json.get_artist_list song.get_artist_list
end
