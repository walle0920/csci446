require 'sinatra'
require 'data_mapper'
require 'rubygems'


DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/books.sqlite3.db")

require_relative 'book'



get '/' do
    @books = Book.all(:order => [:id])
    erb :form
end



get '/post/:id' do
    @books = Book.get(params[:id])
    erb :post
end