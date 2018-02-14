class AlbumApp

  def call(env)
  	request = Rack::Request.new(env)
    
    if request.path == '/albums'
      response_head = "<!DOCTYPE HTML><html><head><title>Top 100 Albums</title></head><body>"
      response_body << response_head.to_s

      simpleArrayTest = Array.new
      File.open("top_100_albums.txt").each do |line|
        # response_body << line.to_s
        simpleArrayTest << line.to_s
      end

      for albums in simpleArrayTest
        response_body << albums
      end
      #response_body << albums.to_s

      response_tail = "</body></html>"
      response_body << response_tail
      [200, {'Content-Type' => 'text/html'}, [response_body.to_s]]
    else
      [404, {'Content-Type' => 'text/html'}, ["Uknown URL"]]
    end
  end
end
