class CustomRescueMiddleware
  attr_reader :rescue_table

  def initialize(&block)
    @rescue_table = []
    instance_eval &block
  end

  def rescue_from(error_class, &block)
    rescue_table << [error_class, block]
  end

  # Implement the requirement for {GraphQL::Schema::MiddlewareChain}
  def call(*args)
    begin
      yield
    rescue StandardError => err
      attempt_rescue(err)
    end
  end

  private

  def attempt_rescue(err)
    handler = rescue_table.find { |handler| err.is_a? handler.first }
    if handler
      message = handler.second.call(err)
      GraphQL::ExecutionError.new(message)
    else
      raise(err)
    end
  end
end
