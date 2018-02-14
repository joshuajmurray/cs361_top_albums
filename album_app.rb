class AlbumApp

  def call(env)
  	req = Rack::Request.new(env)
  	path = req.path
    if '/albums'==path
      response_head = "<!DOCTYPE HTML><html><head><title>Top 100 Albums</title></head><body>"
      response_body << response_head.to_s
      
      albums = ['fee', 'fi', 'fo', 'funk']
      response_body << albums.to_s

      response_tail = "</body></html>"
      response_body << response_tail
      [200, {'Content-Type' => 'text/html'}, [response_body.to_s]]
    else
      [404, {'Content-Type' => 'text/html'}, ["Uknown URL"]]
    end
  end
end
