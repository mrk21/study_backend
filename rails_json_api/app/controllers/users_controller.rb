class UsersController < ApplicationController
  def index
    render json: User.all, adapter: :json_api, fields: params[:fields]
  end
  
  def show
    user = User.find(params[:id])
    render json: user, adapter: :json_api, fields: params[:fields]
  end
end
