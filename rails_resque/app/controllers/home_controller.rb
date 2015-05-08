class HomeController < ApplicationController
  def hello
    Resque.enqueue(Hello, params[:message])
    render text: params[:message]
  end
end
