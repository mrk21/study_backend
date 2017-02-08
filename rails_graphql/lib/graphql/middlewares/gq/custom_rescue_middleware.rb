class GQ::CustomRescueMiddleware
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
    rescue StandardError => e
      attempt_rescue(e)
    end
  end

  private

  def attempt_rescue(e)
    error_class, handler = rescue_table.find { |item| e.is_a? item.first }
    if error_class
      message = handler.call(e)
      GraphQL::ExecutionError.new(message)
    else
      raise e
    end
  end
end
