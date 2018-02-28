require 'csv'
require_relative 'album'
class AlbumList

  ALBUMS_SOURCE = 'top_100_albums.txt'

  attr_accessor :albums

  def initialize()
    puts "build albums:"
    @albums = []
    CSV.foreach(ALBUMS_SOURCE).with_index(0) do |line, i|
      @albums << Album.new(i+1, line[0], line[1].delete_prefix(' '))
    end
  end

  # def sortBy(attribute)#couldn't get this to work.. 
  #   # @albums.sort_by { |o| o.send(attribute.to_sym) }
  # end

  def sortBy(attribute)
    @current_sort_order = attribute

    if attribute == 'title'
      puts "title sort"
      @albums = @albums.sort_by{|album| album.title}
    elsif attribute == 'year'
      puts "year sort"
      @albums = @albums.sort_by{|album| album.year}
    else
      puts "rank sort"
      @albums = @albums.sort_by{|album| album.rank}
    end

  end

end
