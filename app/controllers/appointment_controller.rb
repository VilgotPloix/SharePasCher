class AppointmentController < ApplicationController
  before_action :authenticate_user!
  before_action :check_profile_completion, only: [:create]
  
  def index
  end

  def new
    
  end

  def create
    Appointment.create(user_id: current_user.id, event_id: params[:event_id], is_accepted: false)
    redirect_to events_path flash[:info]="Vous avez été inscrits ! Vous recevrez un email si l'hôte vous accepte à son évènement !"
  end

  def show
  end

  def update
    @user = params[:user_id]
    @event_id = params[:event_id]
    @event = Event.find(@event_id)
    @appointment = Appointment.where(user_id: @user, event_id: @event)
    @appointment.update(is_accepted: true)
    Event.find(@event_id).update(current_guests: (@event.current_guests + 1))
    clear_appointments(@user, @event)
    redirect_to event_path(@event_id)
    AppointmentMailer.accepted_mail(@appointment).deliver_now
  end

  def destroy
    @user = params[:user_id]
    @event = params[:event_id]
    @appointment = Appointment.where(user_id: @user, event_id: @event)

    if @appointment.first.is_accepted?
      @appointment.destroy_all
      Event.find(params[:event_id]).update(current_guests: (Event.find(@event).current_guests - 1))
    else      
      @appointment.destroy_all
    end

    redirect_to event_path(@event)
  end

  private 

  def clear_appointments(user, actual_event)
    @appointments= User.find(user).appointments
    @appointments.each do |appointment|
      if (appointment.event.date == actual_event.date) && (!appointment.is_accepted?)
        appointment.destroy
      end
    end
  end

  def check_profile_completion
    if current_user.is_profile_fully_completed == false
      redirect_to edit_user_registration_path flash[:warning]="Veuillez compléter votre profil avant de pouvoir accéder à ce contenu"
    end
  end
end
