class Helpers

  def self.current_user(sessions_hash)
    User.find_by(id: sessions_hash[:user_id])
  end

  def self.is_logged_in?(sessions_hash)
    !!sessions_hash[:user_id]
  end


end
