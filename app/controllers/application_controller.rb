# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  helper :all # include all helpers, all the time
  helper_method :logged_in?, :twitter_user_screen_name, :current_user
  
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  protected

  def logged_in?
    current_user
  end
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end
  
  def current_user=(user)
    if user
      @current_user = user
      session[:user_id] = user.id
    end
  end

  def twitter_user_id
    current_user.twitter_id
  end
  
  def twitter_user_screen_name
    current_user.screen_name
  end

end
