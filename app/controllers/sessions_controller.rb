class SessionsController < ApplicationController
  def index
  end

  def create
    p params[:session]
    render :index
  end

  def destroy 
  end
end
