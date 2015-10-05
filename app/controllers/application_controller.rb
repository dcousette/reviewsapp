class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?, :review_exists_already?
  
  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  
  end 
  
  def logged_in?
    !!current_user
  end
  
  def review_exists_already?(restaurant, user)
    restaurant.reviews.reload.any? {|review| review[:user_id] == user.id }
  end
  
  def require_login
    if !logged_in?
      flash[:danger] = "Please sign in first"
      redirect_to login_path
    end
  end
end
