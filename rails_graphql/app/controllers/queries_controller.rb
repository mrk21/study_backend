class QueriesController < ApplicationController
  def create
    render json: ApiSchema.execute(*query_args)
  end

  private

  def query_args
    query = params.require(:query)
    options = params.slice(:variables, :operationName)
    options.permit!
    options = options.to_h.map { |k,v| [k.to_s.underscore.intern, v] }
    options = Hash[*options.flatten]
    options[:context] = context
    [query, options]
  end

  def context
    {
      session: session
    }
  end
end
