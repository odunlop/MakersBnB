require 'sinatra/base'
require 'sinatra/reloader'
require_relative './database_connection_setup'

class MakersBnB < Sinatra::Base 
  enable :sessions
  configure :development do 
    register Sinatra::Reloader 
  end

  get '/' do 
    "Test!"
    # Have sign up box in index.erb
  end

  get '/spaces' do 
  end

  get '/spaces/new' do 
  end

  run! if app_file == $0
end
