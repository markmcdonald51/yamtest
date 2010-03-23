# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  helper_method :current_user
  
  before_filter :authorize

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def current_user
    if session[:user_id]    
      @current_user ||= User.find session[:user_id]    
    end 
    @current_user 
  end
  
  def authorize
    unless current_user
      redirect_to login_path
    end 
  end
  
  
  
end
