class WelcomeController < ApplicationController
  def index
    @logged_in = session[:logged_in] || false
  end
end
