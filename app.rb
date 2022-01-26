require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative './lib/user'
require_relative 'database_connection_setup'

class MakersBnB < Sinatra::Base 
  enable :sessions
  register Sinatra::Flash
  configure :development do 
    register Sinatra::Reloader 
  end

  get '/' do 
    erb(:index)
    # Have sign up box in index.erb
  end

  get '/spaces' do 
    redirect '/' if session[:user_id] == nil
    "All spaces"
  end

  get '/spaces/new' do 
    "Form to create new space"
  end

  get '/sessions/new' do
    # Log in page
    erb(:login_form)
  end

  get '/sessions' do 
    @email = session[:user_email]
    erb(:logged_in)
  end

  post '/sessions' do 
    user = User.authenticate(email: params[:email], password: params[:password])
    
    if user 
      session[:user_id] = user.id
      session[:user_email] = user.email # will be deleted later
      redirect('/sessions')
    else 
      flash[:notice] = "Please check your email and/or password is correct"
      redirect('/sessions/new')
    end
  end

  post '/users/new' do 
    if params['password'] == params['password_confirmation']
      user = User.create(email: params['email'], password: params['password'])
      session[:user_id] = user.id
      session[:user_email] = user.email # will be deleted later
      redirect '/sessions'
    else 
      flash[:notice] = "Passwords do not match, try again"
      redirect('/')
    end
  end

  run! if app_file == $0
end
