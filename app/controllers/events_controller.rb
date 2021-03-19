class EventsController < ApplicationController
  def index
    @event = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
  end

  def create
  end

  def destroy
  end
end
