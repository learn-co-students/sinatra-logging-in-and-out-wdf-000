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
    # @user = User.where(username:params[:username], password:params[:password]).take!
    begin
      @user = User.where(username:params[:username], password:params[:password]).take!
    rescue
      erb :error
    else
      @user.save
      session[:user_id] = @user.id
      redirect '/account'
    end
  end

  get '/account' do
      # @user = Helpers.current_user(session)
      # erb :account

      begin
        if Helpers.is_logged_in?(session) == true
        @user = Helpers.current_user(session)
      else
        erb :error
      end
      rescue
        erb :error
      else
        erb :account
    
    end

  end

  get '/logout' do
        redirect '/'
  end


end
