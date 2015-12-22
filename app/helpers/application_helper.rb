module ApplicationHelper
  def get_artist_with_link song
    song.artists.map{|artist| "#{link_to artist.kh_name, artist_path(artist)}"}.join(", ")
  end

  def paginate_page collection
    paginate collection, theme: "twitter-bootstrap-3"
  end

  def full_title page_title = ""
    base_title = t "title"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
