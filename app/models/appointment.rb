 class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :confirmation_send

 

  def confirmation_send
  	AppointmentMailer.confirmation_mail(self).deliver_now
  end


end
