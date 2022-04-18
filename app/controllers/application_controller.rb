class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in? # To make this helper method avalible on the view helpers

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

end
