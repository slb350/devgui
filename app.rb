require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'

enable :sessions

class Post < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3 }
  validates :body, presence: true
end

helpers do
  def title
    if @title
      "#{@title}"
    else
      "iMatchative DevOps"
    end
  end
end

get "/" do
  @posts = Post.order("created_at DESC")
  @title = "iMatchative DevOps"
  erb :"posts/index"
end

get "/posts/create" do
  @title = "Create post"
  @post = Post.new
  erb :"posts/create"
end

post "/posts" do
  @post = Post.new(params[:post])
  if @post.save
    redirect "posts/#{@post.id}", :notice => 'New post. (This message will disapear in 4 seconds.)'
  else
    redirect "posts/create", :error => 'Something went wrong. Try again. (This message will disapear in 4 seconds.)'
  end
end

get "/posts/:id" do
  @post = Post.find(params[:id])
  @title = @post.title
  erb :"posts/view"
end

get "/posts/:id/edit" do
  @post = Post.find(params[:id])
  @title = "Edit Form"
  erb :"posts/edit"
end

put "/posts/:id" do
  @post = Post.find(params[:id])
  @post.update(params[:post])
  redirect "/posts/#{@post.id}"
end