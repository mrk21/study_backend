class HomeController < ApplicationController
  before_action :login_required
  
  def index
  end
end
