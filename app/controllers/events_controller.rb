class EventsController < ApplicationController
  def index
  end
  def new
    @option = params[:option]
    @count = params[:count]
    @level = params[:level]
  end
  def create
    @a = params[:a]
    @q = params[:q]
    @c = params[:c]
    @option = params[:option]
    @count = params[:count]
    @level = params[:level]
  end
end
