class MyJob < ActiveJob::Base
  queue_as :default

  def perform(message)
    Task.new.exec(message)
  end
end
