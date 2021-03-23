class AppointmentMailer < ApplicationMailer

	default from: "gustavevilgot@mail.com"
	
	def confirmation_mail(appointment)
		
		@invité = Appointment.last.user

		@host = Appointment.last.event.host

		@url = "https://sharepascher.herokuapp.com/"

		mail(to: @host.email, subject: "Une personne souhaite venir à ton repas !")

	end

	def accepted_mail(appointment)
		
		@invité = Appointment.last.user

		@host = Appointment.last.event.host

		@url = "https://sharepascher.herokuapp.com/"

		mail(to: @invité.email, subject: "Une personne souhaite venir à ton repas !")

	end


end

