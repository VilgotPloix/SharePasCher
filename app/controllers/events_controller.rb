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
    @event = Event.create!(title: params[:title], description: params[:description], date: params[:date])
    @event.save
  end

  def new
    
  end

  def destroy
  end

  def created_index
  end

end
