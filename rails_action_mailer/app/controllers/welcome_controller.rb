class WelcomeController < ApplicationController
  def index
  end
  
  def send_mail
    WelcomeMailer.notification.deliver_now
    redirect_to welcome_index_path
  end
end
