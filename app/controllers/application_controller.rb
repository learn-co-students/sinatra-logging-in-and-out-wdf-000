require 'pry'

require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do                 #this is the home page with an index erb consisting
    erb :index              #of a form
  end

  post '/login' do
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      session[:user_id] = @user.id
        redirect '/account'
    else
        erb :error
      end
    end

    #this method first looks for the user. if the user is found, remember
    #the finy_By method requires key value pair. If the user is found
    #@user returns true
    #then we equal the session id to the user id
    #and we redirect to the /account action which is just another page
    #else we send to the error page where the user has to log in.


    get '/account' do
      if Helpers.is_logged_in?(session)
        @user = User.find(session[:user_id])
        erb :account
      else
        erb :error
      end
    end

  #this method looks to see if the user is logged in. the helper methods just
  #make code much more cleanse for the controller. the helper method is logged in
  #passes the session of the current session in the method and if it returns true the
  #user is logged in. if the session hash as the id. its a boolean. if the session
  #has the id the we find the user with that if to only create a class variable to use in the account erb. we use find which accepts key value pair as well and
  #then we move to the account page else the error page which asks you to log in.
  #the user is the current user because we are searching for the current session id.
  #we then use the @user.username and password to retrieve the users info. At the end we ask that the user is given the oppertunity to logout via a path /logout. in the logout get method we clear the session thus the user is logged out.

  get '/logout' do
    session.clear
  end


end
