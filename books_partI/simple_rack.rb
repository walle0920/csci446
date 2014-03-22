#!/usr/bin/ruby

require 'rack'
require 'ERB'
require 'sqlite3'

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
        #File.open("form.html", "r") { |form| response.write(form.read) }
        response.write(ERB.new(File.read("form.html.erb")).result(binding))
        render_year(request, response)
      when /\/author.*/
        # author list
        #File.open("form.html.erb", "r") { |form| response.write(form.read) }
        response.write(ERB.new(File.read("form.html.erb")).result(binding))
        render_author(request, response)
        when /\/title.*/
        # title list 
        #File.open("form.html", "r") { |form| response.write(form.read) }
        response.write(ERB.new(File.read("form.html.erb")).result(binding))
        render_title(request, response)
        when /\/id.*/
        # id list 
        #File.open("form.html", "r") { |form| response.write(form.read) }
        response.write(ERB.new(File.read("form.html.erb")).result(binding))
        render_id(request, response)
        when /\/language.*/
        # language list 
        #File.open("form.html", "r") { |form| response.write(form.read) }
        response.write(ERB.new(File.read("form.html.erb")).result(binding))
        render_language(request, response)
      else
        [404, {"Content-Type" => "text/plain"}, ["Error 404!"]]
      end	# end case
       File.open("footer.html", "r") { |footer| response.write(footer.read) }
      response.finish
    end

  # try http://localhost:8080/year
	def render_year(req, response)
		db = SQLite3::Database.new( "books.sqlite3.db" )
        db.execute( "select * from books order by published" ) do |row|
        response.write("<tr><td>#{row[0]}</td><td>#{row[1]}</td><td>#{row[2]}</td><td>#{row[3]}</td><td>#{row[4]}</td><td>#{row[5]}</td></tr>\n")
         end
	end
# try http://localhost:8080/author
def render_author(req, response)
    db = SQLite3::Database.new( "books.sqlite3.db" )
        db.execute( "select * from books order by author" ) do |row|
        response.write("<tr><td>#{row[0]}</td><td>#{row[1]}</td><td>#{row[2]}</td><td>#{row[3]}</td><td>#{row[4]}</td><td>#{row[5]}</td></tr>\n")
        end
end
# try http://localhost:8080/id
def render_id(req, response)
    db = SQLite3::Database.new( "books.sqlite3.db" )
        db.execute( "select * from books order by id" ) do |row|
        response.write("<tr><td>#{row[0]}</td><td>#{row[1]}</td><td>#{row[2]}</td><td>#{row[3]}</td><td>#{row[4]}</td><td>#{row[5]}</td></tr>\n")
        end
end
# try http://localhost:8080/language
def render_language(req, response)
    db = SQLite3::Database.new( "books.sqlite3.db" )
        db.execute( "select * from books order by language" ) do |row|
        response.write("<tr><td>#{row[0]}</td><td>#{row[1]}</td><td>#{row[2]}</td><td>#{row[3]}</td><td>#{row[4]}</td><td>#{row[5]}</td></tr>\n")
        end
end
# try http://localhost:8080/title
def render_title(req, response)
    db = SQLite3::Database.new( "books.sqlite3.db" )
        db.execute( "select * from books order by title" ) do |row|
        response.write("<tr><td>#{row[0]}</td><td>#{row[1]}</td><td>#{row[2]}</td><td>#{row[3]}</td><td>#{row[4]}</td><td>#{row[5]}</td></tr>\n")
        end
end


end


Signal.trap('INT') {
	Rack::Handler::WEBrick.shutdown
}

Rack::Handler::WEBrick.run SimpleApp.new, :Port => 8080
