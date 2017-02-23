class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    # @current_user is always nil at the beginning
    # of the request (in action or view). 
    # return code line just prevents calling DB
    # twice or more. you will always call DB once
    return @current_user if @current_user
    puts "session: #{session[:user_id]}"
    if session[:user_id]
      puts 'If'
      @current_user = User.find(session[:user_id])
    end
    # Equivalent
    # @current_user ||= User.find(session[:user_id])
  end
end
