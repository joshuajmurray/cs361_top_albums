class AlbumApp

  def call(env)
  	request = Rack::Request.new(env)
    if request.path.include? '/albums'
      response_body = "<!DOCTYPE HTML><html><head><title>Top 100 Albums</title></head><body>"
      response_body << "<h1>Top 100 Albums of All Time</h1>"

      response_body << "Sort By:<button>Rank</button><button>Title</button><button>Year</button><br><br>"
      response_body << "<input type='text' name='highlight_num'><button>Highlight</button><br><br><br>"

      albumArray = Array.new
      albumArrayOut = Array.new

      File.open("top_100_albums.txt").each_with_index do |line,i|
        albumArray << { rank: i + 1,  title: line.to_s.split(", ")[0], year: line.to_s.split(", ")[1].chomp.to_i }
      end

      if '/albums' == request.path
        albumArrayOut = albumArray
      elsif '/albums/title' == request.path
        albumArrayOut = albumArray.sort_by { |o| o[:title] }
      elsif '/albums/year' == request.path
        albumArrayOut = albumArray.sort_by { |o| o[:year] }
      end

      response_body << "<table><tr><th>Rank</th><th>Album Name</th><th>Date Released</th></tr>"
      albumArray.each do |album|
        response_body << "<tr><td>" << album[0].to_s << "</td><td>" << album[1].to_s << "</td><td>" << album[2].to_s << "</td></tr>"
      end
      response_body << "</table>"

      response_tail = "</body></html>"
      response_body << response_tail
      
      [200, {'Content-Type' => 'text/html'}, [response_body.to_s]]
    else
      [404, {'Content-Type' => 'text/html'}, ["Uknown URL"]]
    end
  end
end
