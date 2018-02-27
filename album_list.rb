# class AlbumList

  ALBUMS_SOURCE = "top_100_albums.txt"

  attr_accessor :albums

  def initialize()
    @albums = []
    CSV.foreach_with_index(ALBUMS_SOURCE) do |line, i|
      @albums << Album.new(i+1, line[0], line[1])
    end
  end

  def sortBy(attribute)
    @albums.sort_by { |o| o.send(attribute.to_sym) }
  end

end
