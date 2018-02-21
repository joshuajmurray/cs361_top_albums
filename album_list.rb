class AlbumList

  ALBUMS_SOURCE = "top_100_albums.txt"

  def initialize(albums)
    @albums = File.foreach(ALBUMS_SOURCE).map { |line| line.split(', ') }
  end

end
