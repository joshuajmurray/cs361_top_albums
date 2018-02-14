class AlbumApp

  def call(env)
  	request = Rack::Request.new(env)
    if '/albums' == request.path
      response_body = "<!DOCTYPE HTML><html><head><title>Top 100 Albums</title></head><body>"
      response_body << "<h1>Top 100 Albums of All Time</h1>"

      albumArray = Array.new

      File.open("top_100_albums.txt").each_with_index do |line,i|
        albumArray << [i + 1,  line.to_s.split(", ")[0], line.to_s.split(", ")[1].chomp.to_i]
      end

      albumArray.each do |album|
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
