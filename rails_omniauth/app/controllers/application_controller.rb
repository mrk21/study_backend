class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  protected
  
  def login_required
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end
end
