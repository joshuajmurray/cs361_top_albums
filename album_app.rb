class AlbumApp

  def call(env)
  	request = Rack::Request.new(env)
    if request.path.include? '/albums'
      response_body = "<!DOCTYPE HTML><html><head><title>Top 100 Albums</title></head><body>"
      albumArray = Array.new
      albumArrayOut = Array.new
      response_body << "<h1>Top 100 Albums of All Time</h1>"
      File.open("top_100_albums.txt").each_with_index do |line,i|
        albumArray << { rank: i + 1,  title: line.to_s.split(", ")[0], year: line.to_s.split(", ")[1].chomp.to_i }
      end

      if '/albums/title' == request.path
        albumArrayOut = albumArray.sort_by { |o| o[:title] }
        puts "title sort"
      elsif '/albums/year' == request.path
        albumArrayOut = albumArray.sort_by { |o| o[:year] }
        puts "year sort"
      end

      albumArrayOut.each do |album|
        response_body << album.to_s
      end

      response_tail = "</body></html>"
      response_body << response_tail
      [200, {'Content-Type' => 'text/html'}, [response_body.to_s]]
    else
      [404, {'Content-Type' => 'text/html'}, ["Uknown URL"]]
    end
  end
end
