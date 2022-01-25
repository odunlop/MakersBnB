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
    erb(:index)
    # Have sign up box in index.erb
  end

  get '/spaces' do 
  end

  get '/spaces/new' do 
  end

  get '/sessions/new' do
    # Log in page
  end

  get '/sessions' do 
    @email = session[:user_email]
    erb(:signup)
  end

  post '/sessions' do 
    user = User.create(email: params['email'], password: params['password'])
    session[:user_id] = user.id
    session[:user_email] = user.email
    redirect '/sessions'
  end

  run! if app_file == $0
end
