class AppointmentController < ApplicationController
  def index
  end

  def new
    
  end

  def create
    Appointment.create(user_id: current_user.id, event_id: params[:event_id])
    redirect_to events_path
  end

  def show
  end

  def update
  end

  def destroy
  end
end
