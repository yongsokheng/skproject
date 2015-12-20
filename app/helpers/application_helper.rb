module ApplicationHelper
  def get_artist_with_link song
    song.artists.map{|artist| "#{link_to artist.kh_name, artist_path(artist)}"}.join(", ")
  end
end
