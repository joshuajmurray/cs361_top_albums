class AlbumApp

  def call(env)
  	req = Rack::Request.new(env)
  	path = req.path
    if '/albums'==path
      albumArray = Array.new
      response_body = "<h1>Top 100 Albums of All Time</h1>"
      File.open("top_100_albums.txt").each_with_index do |line,i|
        albumArray << [i + 1,  line.to_s.split(", ")[0], line.to_s.split(", ")[1].chomp.to_i]
      end

      albumArray.each do |album|
        response_body << album.to_s
      end
      [200, {'Content-Type' => 'text/html'}, [response_body.to_s]]
    else
      [404, {'Content-Type' => 'text/html'}, ["Uknown URL"]]
    end
  end
end