require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative './lib/user'
require_relative './lib/space'
require_relative './lib/bookings'
require_relative './lib/calendar'
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
    @spaces = Space.all
    erb :'spaces/all_spaces'
  end

  get '/spaces/new' do 
    erb :"spaces/new_space"
  end

  post '/spaces' do 
    Space.create(name: params[:name], description: params[:description], price: params[:price], creator: session[:user_id] )
    redirect '/spaces'
  end

  get '/spaces/mine' do 
    @spaces = Space.mine(session[:user_id])
    erb :'spaces/all_spaces'
  end

  get '/sessions/new' do
    # Log in page
    erb(:login_form)
  end

  get '/sessions' do 
    @email = session[:user_email]
    erb(:logged_in)
  end

  get '/spaces/requests' do
    @requests = Bookings.get_bookings(user_id: session[:user_id])
     erb :'spaces/requests'
  end

  post '/bookings/new' do 
    Bookings.create(space_id: params['space_id'], date: params['date'], confirmed: false, user_id: session[:user_id])
    session[:date] = params['date']
    redirect '/spaces'
  end

  post '/spaces/requests' do
    redirect '/spaces/requests'
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

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/'
  end

  get '/spaces/:id' do 
    @space = Space.find(params[:id])
    @calendar = Calendar.new.generate(30)
    erb :'spaces/space'
  end

  run! if app_file == $0
end
