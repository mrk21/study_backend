class UsersController < ApplicationController
  def index
    render json: User.all, adapter: :json_api
  end
end
