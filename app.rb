# coding: utf-8

Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db("sknow")
end

enable :sessions

get '/' do
  @posts = Post.all
  slim :index
end

get '/show/:id' do
  @post = Post.find(params[:id])
  slim :show
end 

get '/new' do
  @post = Post.new
  slim :new
end

post '/' do
  @post = Post.new(params[:post])
  @post.save
  redirect "/show/#{@post.id}"
end

get '/:id/edit' do
  @post = Post.find(params[:id])
  slim :edit
end
  
post '/:id' do
  @post = Post.find(params[:id])
  @post.write_attribute(params[:post])
  redirect "/show/#{@post.id}"
end

