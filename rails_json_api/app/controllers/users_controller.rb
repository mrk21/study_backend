class UsersController < ApplicationController
  def index
    render json: User.includes(:notes).page(1).per(1), adapter: :json_api
  end
  
  def show
    user = User.find(params[:id])
    render json: user, adapter: :json_api, fields: params[:fields], include: params[:include]
  end
end
