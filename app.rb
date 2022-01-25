require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/user' 
require_relative 'database_connection_setup'

class MakersBnB < Sinatra::Base 
  enable :sessions
  configure :development do 
    register Sinatra::Reloader 
  end

  get '/' do 
    erb :index
  end

  get '/sessions/new' do
    erb :new
  end

  post '/users/new' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/spaces'
  end

  get '/spaces' do 
    @user = User.find(session[:user_id])
    erb :spaces
  end

  get '/spaces/new' do 
  end

  run! if app_file == $0
end
