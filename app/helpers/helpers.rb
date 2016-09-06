class Helpers

  def self.current_user(session)
    @user = User.find(session[:user_id])
    # binding.pry
    @user
  end

  def self.is_logged_in?(session)
    !!session[:user_id]
    # binding.pry
    # !!Helpers.current_user(session)
  end


end
