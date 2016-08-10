require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :'/sessions/index'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      redirect '/account'
    else
      erb :'/sessions/error'
    end
  end

  get '/registrations/signup' do
    erb :'/registrations/signup'
  end

  post '/registrations' do
    @user = User.create(params[:user])
    session[:user_id] = @user.id
    redirect '/account'
  end

  get '/account' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      erb :account
    else
      erb :'/sessions/error'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/sessions/error' do
    erb :'/sessions/error'
  end


end

