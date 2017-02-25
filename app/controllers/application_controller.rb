class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?, :require_signin

  def current_user
    # @current_user is always nil at the beginning
    # of the request (in action or view). 
    # return code line just prevents calling DB
    # twice or more. you will always call DB once
    return @current_user if @current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
    # Equivalent
    # @current_user ||= User.find(session[:user_id])
  end

  def require_signin
    if !signed_in?
      flash[:warning] = "You must signed in to see this page"
      redirect_to new_session_path
    end
  end

  def signed_in?
    current_user
  end
end
