class AppointmentMailer < ApplicationMailer

	default from: "gustavevilgot@gmail.com"
	
	def confirmation_mail(appointment)
		
		@invité = Appointment.last.user

		@host = Appointment.last.event.host

		@url = "https://sharepascher.herokuapp.com/"

		mail(to: @host.email, subject: "Une personne souhaite venir à ton repas ! - confirmation -")

	end

	def accepted_mail(appointment)
		
		@invité = appointment.user

		@host = appointment.event.host

		@url = "https://sharepascher.herokuapp.com/"

		mail(to: @invité.email, subject: "Une personne souhaite venir à ton repas ! - acceptation -")

	end


end

