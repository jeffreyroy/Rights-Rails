module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns current user
  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  # Returns true if the user is logged in
  def logged_in?
    !current_user.nil?
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end
