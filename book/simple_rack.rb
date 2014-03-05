#!/usr/bin/ruby

require 'rack'

class SimpleApp
	def initialize()
    # can set up variables that will be needed later
		@time = Time.now
	end

	def call(env)
    # create request and response objects
		request = Rack::Request.new(env)
		response = Rack::Response.new
        info = request.params['info']
    # include the header
		File.open("header.html", "r") { |head| response.write(head.read) }
        #File.open("footer.html", "r") { |footer| response.write(footer.read) }
		case env["PATH_INFO"]
      when /.*?\.css/
        # serve up a css file
        # remove leading /
        file = env["PATH_INFO"][1..-1]
        return [200, {"Content-Type" => "text/css"}, [File.open(file, "rb").read]]
      when /\/year.*/
        # year list
        File.open("form.html", "r") { |form| response.write(form.read) }
        render_year(request, response)
      when /\/author.*/
        # author list
        File.open("form.html", "r") { |form| response.write(form.read) }
        render_author(request, response)
        when /\/title.*/
        # title list 
        File.open("form.html", "r") { |form| response.write(form.read) }
        render_author(request, response)
      else
        [404, {"Content-Type" => "text/plain"}, ["Error 404!"]]
      end	# end case
       File.open("footer.html", "r") { |footer| response.write(footer.read) }
      response.finish
    end

  # try http://localhost:8080/year
	def render_year(req, response)
		line_num=0
        File.readlines("books.txt").sort{|a,b| a.split(",")[3] <=>
            b.split(",")[3]}.each do |line|
        #text.gsub!(/\n/, "\n")
        line.gsub!(/,/, "&nbsp&nbsp&nbsp&nbsp&nbsp| |&nbsp&nbsp&nbsp&nbsp&nbsp")
        response.write("<h4>#{line}</h4>\n")
        #response.write("<h2>#{line_num += 1} #{line}</h2>\n")
         end
	end

# try http://localhost:8080/author
def render_author(req, response)
    line_num=0
    File.readlines("books.txt").sort{|a,b| a.split(",")[1] <=>
        b.split(",")[1]}.each do |line|
            #text.gsub!(/\n/, "\n")
            line.gsub!(/,/, "&nbsp&nbsp&nbsp&nbsp&nbsp| |&nbsp&nbsp&nbsp&nbsp&nbsp")
            response.write("<h4>#{line}</h4>\n")
            #response.write("<h2>#{line_num += 1} #{line}</h2>\n")
        end
end
# try http://localhost:8080/title
def render_title(req, response)
    line_num=0
    File.readlines("books.txt").sort{|a,b| a.split(",")[0] <=>
        b.split(",")[0]}.each do |line|
            #text.gsub!(/\n/, "\n")
            line.gsub!(/,/, "&nbsp&nbsp&nbsp&nbsp&nbsp| |&nbsp&nbsp&nbsp&nbsp&nbsp")
            response.write("<h4>#{line}</h4>\n")
            #response.write("<h2>#{line_num += 1} #{line}</h2>\n")
        end
end


end


Signal.trap('INT') {
	Rack::Handler::WEBrick.shutdown
}

Rack::Handler::WEBrick.run SimpleApp.new, :Port => 8080
