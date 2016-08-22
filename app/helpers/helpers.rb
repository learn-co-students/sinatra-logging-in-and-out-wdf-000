class Helpers

  def self.current_user(session)
    #argument is session hash
    #using the user_id from the session id
    # @user_id =
    @user = User.find_by_id(session[:user_id])
  end


  def self.is_logged_in?(session)

    !! session[:user_id]
    # if session[:user_id] == @user_id
    #   true
    # else
    #   false
    # end
  end

end
