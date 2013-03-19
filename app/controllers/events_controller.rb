class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  def new
    @event = Event.new
  end
  def create
    @a = params[:a]
    @q = params[:q]
    @c = params[:c]
  end
end
