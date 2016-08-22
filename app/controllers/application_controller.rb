require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    # binding.pry
    # @user = User.find_by(:username => params[:username])
    @user = User.find_by(:username => params["username"])

    # binding.pry
    if @user
      session[:user_id] = @user.id
      # binding.pry
      redirect '/account'
    else
      erb :error
    end

  end






  get '/account' do
    # @user = User.find_by(:username => params["username"])
    @current_user = User.find_by(session[:user_id])
    # session[:user_id] = @user.id
    if @current_user
      erb :account
    else
      erb :error
    end
  end

  get '/logout' do
    session[:id].clear
  end


end
