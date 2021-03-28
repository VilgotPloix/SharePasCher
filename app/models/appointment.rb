 class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :confirmation_send
  after_update :accepted_send
 

  def confirmation_send
  	AppointmentMailer.confirmation_mail(self).deliver_now
  end


  def accepted_send
  	if self.is_accepted == true
  		AppointmentMailer.accepted_mail(self).deliver_now
  	end
  end

end
