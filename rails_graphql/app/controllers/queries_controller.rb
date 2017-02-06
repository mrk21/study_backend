class QueriesController < ApplicationController
  def create
    render json: ApiSchema.execute(*query_args)
  end

  private

  def query_args
    query = params.require(:query)
    options = params.slice(:variables, :operationName)
    options.permit!
    options = options.to_h
      .stringify_keys
      .transform_keys(&:underscore)
      .symbolize_keys
    options = Hash[*options.flatten]
    options[:context] = context
    [query, options]
  end

  def context
    {
      session: session,
      current_user: current_user
    }
  end

  def current_user
    User.find_by(id: session[:current_user_id])
  end
end
