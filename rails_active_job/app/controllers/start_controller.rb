class StartController < ApplicationController
  def run
    # Executes immediately
    MyJob.perform_later('Task exec.')
    
    # Executes after 10 seconds.
    MyJob.set(wait: 10.seconds).perform_later('Task exec 1.')
    MyJob.set(wait: 10.seconds).perform_later('Task exec 2.')
    
    render :nothing => true
  end
end
