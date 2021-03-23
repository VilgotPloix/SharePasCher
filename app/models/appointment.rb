 class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :confirmation_send
  # after_commit :accepted_send
 

  def confirmation_send
  	AppointmentMailer.confirmation_mail(self).deliver_now
  end

  # def accepted_send
  #   if Appointment.last.is_accepted == true
  # 	 AppointmentMailer.accepted_mail(self).deliver_now
  #   end
  # end

end
