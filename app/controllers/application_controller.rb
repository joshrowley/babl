class ApplicationController < ActionController::Base
  protect_from_forgery

#3.2.7

  def current_user
    User.find(session[:user_id])
  end

  def current_user=(user)
    session[:user_id] = user.id
  end

  helper_method :current_user


end
