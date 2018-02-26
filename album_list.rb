class AlbumList

  ALBUMS_SOURCE = "top_100_albums.txt"

  def initialize(albums)
    @albums = File.foreach(ALBUMS_SOURCE).map { |line| line.split(', ') }
  end

  def sort(request)
      if '/' == request.path
        albumArrayOut = albumArray
      elsif '/title' == request.path
        albumArrayOut = albumArray.sort_by { |o| o[:title] }
      elsif '/year' == request.path
        albumArrayOut = albumArray.sort_by { |o| o[:year] }
      end
  end

end
