# require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
    # render new.erb
  end

  post '/posts' do
    @post = Post.create(params)
    redirect to '/posts'
    # create's a new post object using user params saving to instance variable
    # redirect to /posts url not render erb
  end

  get '/posts' do
    @posts = Post.all
    erb :index
    # saves all post objects to instance variable
    # renders index.erb
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show
    # find id
    # save to instance variable
    # renders show.erb
  end

  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :edit
    # finding post by id and saving to instance variable
    # rendering edit.erb view
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
    # find post by id and save to instance variable
    # set post object name to user = input params :name
    # set post content user input = to params :content
    # tell active record to save the updated object to the database
    # render the show view displaying the updated version
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :deleted
    # find post and save it to instance variable
    # delete post from the database with activerecord
    # render deleted view
  end

end
