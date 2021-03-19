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
    @event = Event.new(title: params[:title], description: params[:description], date: params[:date], city_id: params[:city_id], guests_number: params[:guests_number], host_id: params[:host_id])
    @event.save
    if @event.host.is_host == false
      User.find(@event.host.id).update(is_host: true)
    end

    redirect_to root_path
  end

  def new
    
  end

  def destroy
  end

  private
    def event_params
      params.require(:event).permit(:title, :description, :city, :date, :guest_number)
    end

  def created_index
  end


end
