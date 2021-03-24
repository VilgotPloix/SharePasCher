class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_profile_completion, only: [:new]


  def index
    if params[:tag_id].blank?
      @event = Event.all
    else
      @event = Tag.find(params[:tag_id]).events
    end
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
    @test= 0
    puts @test
    filter_creation(params, @event)
    puts @test
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

    def check_profile_completion
      if current_user.is_profile_fully_completed == false
        redirect_to edit_user_registration_path, warning: "Veuillez compléter votre profil avant de pouvoir accéder à ce contenu"
      end
    end
    
    def filter_creation(params, event)
      for n in (0..Tag.all.count)
        if params[:"tag#{n}"] == "1"
          Filter.create(event_id: event.id, tag_id: (n+1))
        end
      end
    end



end
