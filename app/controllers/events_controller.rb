class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  def new
    @event = Event.new
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
