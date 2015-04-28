class ValuesController < ApplicationController
  def index
    Value.delete_all
    Value.create_values
    @values = Value.all
  end
end
