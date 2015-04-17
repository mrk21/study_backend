class Task
  def exec(message)
    Rails.logger.info(message)
  end
end
