class AlbumApp

  def call(env)
  	req = Rack::Request.new(env)
  	path = req.path
    if '/albums'==path
      simpleArrayTest = Array.new
      response_body = "<h1>Top 100 Albums of All Time</h1>"
      File.open("top_100_albums.txt").each do |line| 
        # response_body << line.to_s
        simpleArrayTest << line.to_s
      end

      for albums in simpleArrayTest
        response_body << albums
      end
      # # Read the data from the file.
      # albums = ['fee', 'fi', 'fo', 'funk']
      # # Append it to the response body.
      # response_body << albums.to_s
      # Send the response
      [200, {'Content-Type' => 'text/html'}, [response_body.to_s]]
    else
      [404, {'Content-Type' => 'text/html'}, ["Uknown URL"]]
    end
  end
end