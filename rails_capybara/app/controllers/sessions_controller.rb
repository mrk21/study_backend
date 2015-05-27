class SessionsController < ApplicationController
  def create
    session[:logged_in] = true
    redirect_to welcome_index_path
  end
  
  def destroy
    session[:logged_in] = false
    redirect_to welcome_index_path
  end
end
