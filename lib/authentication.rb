module Authentication
  def self.included(controller)
    controller.send :helper_method, :current_user,
  end


  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session2 && current_user_session2.record
  end

  def logged_in
    current_user2
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

end