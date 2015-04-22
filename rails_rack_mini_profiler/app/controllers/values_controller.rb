class ValuesController < ApplicationController
  def index
    @values = Value.all
    respond_to do |format|
      format.html
      format.json { render json: @values }
    end
  end
  
  def create
    Value.create_values
    respond_to do |format|
      format.html { redirect_to values_url }
      format.json { self.index }
    end
  end
  
  def destroy
    @value = Value.find(params[:id])
    @value.destroy
    respond_to do |format|
      format.html { redirect_to values_url }
      format.json { render json: @value }
    end
  end
end
