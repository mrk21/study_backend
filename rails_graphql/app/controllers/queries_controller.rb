class QueriesController < ApplicationController
  def create
    query = params[:query]
    render json: Schemas::RootSchema.execute(query)
  end
end
