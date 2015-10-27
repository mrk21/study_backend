class CacheController < ApplicationController
  def show
    unless Redis.current.exists params[:id] then
      sleep 3
      Redis.current.set params[:id], "content of #{params[:id]}"
      Redis.current.expire params[:id], 5
    end
    render text: Redis.current.get(params[:id])
  end
end
