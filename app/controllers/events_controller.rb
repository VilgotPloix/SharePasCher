class EventsController < ApplicationController
  def index
    @event = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.save
  redirect_to events_path
  end

  def destroy
  end

  private
    def event_params
      params.require(:event).permit(:title, :description, :city, :date, :guest_number)
    end

end
