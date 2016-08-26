# require 'sinatra/base'

class Helpers < ActiveRecord::Base
  def self.current_user(session_info)
    @user = User.find_by_id(session_info[:user_id])
    # binding.pry
  end


  def self.is_logged_in?(session_info)
    !!session_info[:user_id]
  end

end
