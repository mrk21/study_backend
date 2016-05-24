class NotesController < ApplicationController
  def index
    render json: Note.all, adapter: :json_api, fields: params[:fields], include: params[:include]
  end
  
  def show
    user = Note.find(params[:id])
    render json: user, adapter: :json_api, fields: params[:fields], include: params[:include]
  end
end
