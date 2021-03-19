class AppointmentController < ApplicationController
  def index
  end

  def new
    
  end

  def create
    Appointment.create(user_id: current_user.id, event_id: params[:event_id], is_accepted: false)
    redirect_to events_path
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
    redirect_to event_path(@event_id)
  end

  def destroy
    @user = params[:user_id]
    @event = params[:event_id]
    @appointment = Appointment.where(user_id: @user, event_id: @event)
    @appointment.destroy_all
    redirect_to event_path(@event)
  end
end
