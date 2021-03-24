class EventsController < ApplicationController
  before_action :authenticate_user!


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
    @event = Event.create(title: params[:title], description: params[:description], date: params[:date], city_id: params[:city_id], guests_number: params[:guests_number], host_id: params[:host_id], current_guests: 0)
    # @event.save
    if @event.host.is_host == false
      User.find(@event.host.id).update(is_host: true)
      redirect_to created_index_events_path, warning: "Vous avez crée un évènement"
    end

    redirect_to events_path
  end

  def new
    
  end

  def destroy
  end

  
  def created_index
    @user = current_user
  end

  private
    def event_params
      params.require(:event).permit(:title, :description, :city, :date, :guest_number)
    end



end
