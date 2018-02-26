require 'sinatra'

get '/' do
  erb :index
end

get '/title' do
  #
end

get '/year' do
  #
end


# class AlbumApp
#
#   def call(env)
#   	request = Rack::Request.new(env)
#     if request.path.include? '/albums'
#       response_body = "<!DOCTYPE HTML><html><head><title>Top 100 Albums</title></head><body>"
#       response_body << "<h1>Top 100 Albums of All Time</h1>"
#       response_body << "<h2 style='display:inline'>Sort By:</h2><a href='#{request.base_url}/albums' style='margin-left:1em'><button>Rank</button></a><a href='#{request.base_url}/albums/title'><button>Title</button></a><a href='#{request.base_url}/albums/year'><button>Year</button></a><br><br>"
#       response_body << "<form method='get' action='#{request.path}'><input type='number' name='highlight'><button type='submit'>Highlight</button></form><br><br><br>"
#
#       albumArray = Array.new
#       albumArrayOut = Array.new
#
#       File.open("top_100_albums.txt").each_with_index do |line,i|
#         albumArray << { rank: i + 1,  title: line.to_s.split(", ")[0], year: line.to_s.split(", ")[1].chomp.to_i }
#       end
#
#       if '/albums' == request.path
#         albumArrayOut = albumArray
#       elsif '/albums/title' == request.path
#         albumArrayOut = albumArray.sort_by { |o| o[:title] }
#       elsif '/albums/year' == request.path
#         albumArrayOut = albumArray.sort_by { |o| o[:year] }
#       end
#
#       response_body << "<table><tr><th>Rank</th><th>Album Name</th><th>Date Released</th></tr>"
#       albumArrayOut.each do |album|
#         response_body << "<tr"
#         if request.params["highlight"] == album[:rank].to_s
#           response_body << " style='background-color:orange'"
#         end
#         response_body << "><td>" << album[:rank].to_s << "</td><td>" << album[:title].to_s << "</td><td>" << album[:year].to_s << "</td></tr>"
#       end
#       response_body << "</table>"
#
#       response_tail = "</body></html>"
#       response_body << response_tail
#       [200, {'Content-Type' => 'text/html'}, [response_body.to_s]]
#     else
#       [404, {'Content-Type' => 'text/html'}, ["Not Found"]]
#     end
#   end
# end
