class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_profile_completion, only: [:new]


  def index
    if params[:tag_id].blank? 
      @event = Event.all
    elsif params[:tag_id] == "0"
      @event = Event.all
      flash.now[:info]="Vous avez été inscrits ! Vous recevrez un email si l'hôte vous accepte à son évènement !"
    elsif params[:tag_id] != "0" 
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
    @event = Event.new(title: params[:title], description: params[:description], date: params[:date], city_id: params[:city_id], guests_number: params[:guests_number], host_id: params[:host_id], current_guests: 0)
    
    if @event.save == true
      @event.save
      filter_creation(params, @event)
      if @event.host.is_host == false
        User.find(@event.host.id).update(is_host: true)
      end
      redirect_to created_index_events_path
    else
      redirect_to new_event_path flash[:warning]="Échec, réessaie"
    end   
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
        redirect_to edit_user_registration_path flash[:warning]="Complète ton profil avant de pouvoir accéder à ce contenu"
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
